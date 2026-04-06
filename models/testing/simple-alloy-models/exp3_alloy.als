// abstract and extends

abstract sig Machine {}
sig Broken in Machine {}

sig Server extends Machine {}
sig Client extends Machine {}