# Prototype Command

Rapid prototyping with auto-accept mode for fast iteration.

## When to Use

- New feature exploration
- Proof of concept
- UI/UX experiments
- Testing ideas quickly

## Instructions

1. **Preparation**
   - Ensure clean git state
   - Create feature branch
   - Document the goal

2. **Execution**
   - Enable auto-accept mode (Shift+Tab)
   - Let Claude work autonomously
   - Review at 80% completion
   - Take over for final refinements

3. **Evaluation**
   - Test the prototype
   - Decide: keep, iterate, or discard
   - If discard: git reset to checkpoint
   - If keep: commit and refine

## Prototype Guidelines

- Start simple, add complexity only if needed
- Focus on core functionality first
- Don't worry about perfection initially
- Commit checkpoints every 10-15 minutes
- Ready to rollback if direction is wrong

## Success Criteria

- [ ] Core functionality works
- [ ] No critical bugs
- [ ] Can be demonstrated
- [ ] Ready for refinement or pivot

## After Prototyping

If successful:
1. Review code quality
2. Add tests
3. Clean up and document
4. Merge or continue development

If unsuccessful:
1. Document what didn't work
2. Reset to checkpoint
3. Try alternative approach
