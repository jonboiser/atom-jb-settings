Relay.createContainer(FooBar, {
  fragments: {
    node: () => Relay.QL`
      fragment on PlanItem {

      }
    `
  },
});
