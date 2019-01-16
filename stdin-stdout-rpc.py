import argparse
import sys
import importlib
from jsonrpc import JSONRPCResponseManager, dispatcher

def run_function(module_name : str, function_name : str, arguments):
    """ Runs the function named function_name located in the module named
        module_name with arguments as arguments.

        Returns the result of the evaluation of this function.
    """
    return getattr(importlib.import_module(module_name), function_name)(arguments)

def evaluate_jrpc_request(string):
    """ Evaluates a JSON-RPC request provided as a string.

        Returns the result of this evaluation (a JSON-RPC response) as a string.
    """
    response = JSONRPCResponseManager.handle(string, dispatcher)
    return response.json

def build_cmd_interface():
    """ Builds the command line interface parser using argparse.

        Returns the parser built.
    """
    parser = argparse.ArgumentParser(
        description='Utility to bridge Pharo and Python through JRPC protocol.')
    parser.add_argument('requests_count', metavar='N', type=int, nargs=1,
                        help='Number of JRPC requests to be read from sdin.')
    return parser

if __name__ == '__main__':
    args = build_cmd_interface().parse_args()
    dispatcher["run_function"] = run_function

    for _ in range(args.requests_count[0]):
        print(evaluate_jrpc_request(sys.stdin.readline()))
