/* globals gauge*/
"use strict";
const { openBrowser, closeBrowser, goto, click, text, title, $, get } = require('taiko');
const assert = require("assert");

beforeSuite(async () => openBrowser());

afterSuite(async () => closeBrowser());

step("Go to homepage at <query>", async query => goto(query));

step("Check title is <word>", async (word) => {
  let t = await title()
  assert.equal(t, word)
})

step("Check <word> text", async (word) => {
 text_to_assert_on = await text(word).exists();
 assert.equal(text_to_assert_on, true)
})
