import React from 'react';

export const Comp = ({ foo }) => {
  return (
    <div id="foo">
      Foo{' '}
      {/* Comment */}
      {[1, 2].map((n) => <span>{n}</span>)}
      <MyComp className={"my-cls"}></MyComp>
    </div>
  )
}












////////////////////////////////////////////////////////////////////////////////
// ^ Screenshot (23 lines)
