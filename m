Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1233742BC35
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 17:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784135539; cv=none; b=oK7WEZhfpBjq6RmC57jWTzaww/JbnBSA2p5xxdsA4hQTe/bhNTbNb1JJ7GJNQ50UBbnBUg9/UhJU11ibkkpcPdbIG2aKwZLnWSdjJt/jQof3khy62xyPxnZtYKct8E6lLhbauJqOBI7jk4peI4P1SDatPb4xjABce9ce1CCnATo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784135539; c=relaxed/simple;
	bh=aLSCllbEU9q7DRvLcM8t8FW9AoB3EoV7WA0747CzLRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ecWjaaJ7tvaxs74bT9yT21jNDmck6ix0BSzwkUWr1SafIF0SxNepDGyGh72dI0M24byN2Vq1OEiyvUI3JeK1WjwK2iaIwUv1rV/ca1SMT5ASrwmW3FsugDz+zravNTZhk/ddxYKFdfIcezI95AtWdMRRKCA0vnhpe55IjiJJpJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fCBsXu14; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fCBsXu14"
Message-ID: <153db0fa-65ac-49de-9bf5-456c9639954c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784135532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vk9CWY7aGdz0JSYqsEotsmxVtdAivhiy5sc7diF4EZg=;
	b=fCBsXu14c0RXGitMuAal0egSVP8YhM+74CkdeSHWaN3FsPYPr/xfJfC1BBbGOK/JiFicBq
	rKjjxJUtgKE0yzWGFPko7ngL1TXOmgIkAj0U+FxrbuAGzLI7Uebu0QEUdny8+HcKkWvQ9/
	uUE1C74u+r/EAjXonjapJiDlBiILjX0=
Date: Wed, 15 Jul 2026 10:12:03 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Linking Patchwork with Sashiko?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Derek Barbosa <debarbos@redhat.com>, Matthieu Baerts <matttbe@kernel.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Steven Rostedt <rostedt@goodmis.org>,
 users@kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>,
 Stephen Finucane <stephenfin@redhat.com>, bpf <bpf@vger.kernel.org>,
 Chris Mason <clm@meta.com>, Christian Brauner <brauner@kernel.org>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
References: <akQlPSNfGEllNVhe@debarbos-thinkpadt14gen5.rmtusma.csb>
 <20260710074528.5a6e4457@foz.lan> <20260710083845.23c753ca@foz.lan>
 <87wlv2jq4t.fsf@linux.dev> <20260713095538.3d5e86f1@foz.lan>
 <20260713094120.GD1127719@killaraus.ideasonboard.com>
 <20260713220427.582b28bf@foz.lan> <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
 <20260715005909.GF1656185@killaraus.ideasonboard.com>
 <00a244f8-5be6-4ee7-b5b1-e4cbdcd4fc77@linux.dev>
 <20260715163921.GH1778116@killaraus.ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <20260715163921.GH1778116@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/15/26 9:39 AM, Laurent Pinchart wrote:
> On Wed, Jul 15, 2026 at 09:28:03AM -0700, Ihor Solodrai wrote:
>> On 7/14/26 5:59 PM, Laurent Pinchart wrote:
>>> [...]
>>
>> Yes, assessing whether AI report is "real" is work, but it's not
>> reasonable to push this work on already overwhelmed maintainers. And
>> if AI is wrong, again it's the job of the author to convince the
>> maintainers it's wrong.
> 
> We disagree on this as well. This would force contributors to constantly
> justify their value against a machine that is known to produce a
> non-negligible quantity of nonsense.

I know what you mean and I can relate. Going through walls of
AI-generated paragraphs is not fun, to put it lightly.

However it seems that you are suggesting to simply delegate this work
to maintainers, and I very much disagree with that approach (even
though I'm not a maintainer myself).

I hope you're not saying "let's just not use AI", because that ship
has sailed a while ago.

And if automated AI reviews are there, someone has to do the
triage. AI can do the triage itself only to a limited degree. For
example, there are instructions in review-prompts where AI checks
whether an issue has already been discussed. But it will never be
perfect.

I think it makes much more sense for the author of the patch to do the
triage, as they have the best context of the work, and they are
usually the most invested in their patch being merged in.

> Furthermore, if those generative AI
> tools are as good as their supporters claim, the time they free for
> maintainers should outweight the need workload to triage the comments.

Even if the AI tools were ~perfect with respect to code review, I
think people would still be signing off patches and taking
responsibility for them.

An imaginary perfect AI reviewer that maintainer can trust to land
code without looking at it would essentially become an AI maintainer.
Independent of whether you think it's possible, it hasn't happened
yet, so we have to deal with imperfect AI in the meanwhile.


> >> I set up automated AI code reviews on BPF list using Chris Mason's
>> prompts in the fall last year [3], before sashiko was developed. And
>> originally we were very worried about the quality of the reviews.
>>
>> Time has showed that we had to be more worried about the average
>> quality of incoming patch instead.
>>
>> [1] https://lore.kernel.org/bpf/CAADnVQKsM8iOGO3ZL3LgbWigOBBMrGbTYZ_k_Ktz=+cVkvRLXg@mail.gmail.com/
>> [2] https://lore.kernel.org/all/20260703-vfs-summer-jam-22b2edbbbc44@brauner/
>> [3] https://lore.kernel.org/all/0d6aa077-1222-49a0-9554-dd922122a904@meta.com/
>>
>>> I believe we should
>>> follow the first two recommendations of the Software Freedom Conservancy
>>> on using LLM-backed generative AI systems for FOSS contributions ([1]).
>>>
>>> [1] https://sfconservancy.org/llm-gen-ai/llm-backed-generative-ai-recommendations.html
> 

