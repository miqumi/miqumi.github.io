import{j as i,a as e,I as l,b as a,L as d,N as x,T as h,c as f}from"./index-66b31bed.js";function s(n){const r=n.direction||"right",o=!!n.url,c=!!n.to,t=i("span",{className:"group mt-1 inline-flex cursor-pointer items-center space-x-1 pr-1 font-bold text-type-link hover:text-type-linkHover active:scale-95",children:[r==="left"?e("span",{className:"text-xl transition-transform group-hover:-translate-x-1",children:e(l,{icon:a.ARROW_LEFT})}):null,e("span",{className:"flex-1",children:n.linkText}),r==="right"?e("span",{className:"text-xl transition-transform group-hover:translate-x-1",children:e(l,{icon:a.ARROW_RIGHT})}):null]});return o?e("a",{href:n.url,children:t}):c?e(d,{to:n.to,children:t}):e("span",{onClick:()=>n.onClick&&n.onClick(),children:t})}function m(){return i("div",{className:"py-48",children:[e(x,{}),i(h,{classNames:"flex flex-col space-y-4",children:[e(f,{children:"Developer tools"}),e(s,{to:"/dev/video",direction:"right",linkText:"Video tester"}),e(s,{to:"/dev/test",direction:"right",linkText:"Test page"})]})]})}export{m as default};
//# sourceMappingURL=DeveloperPage-9007a8c1.js.map
