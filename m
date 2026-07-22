Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62F229D260
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 12:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723282; cv=none; b=jOWlHsdz4vkdcHo64G1c7QQDJZ5X58aWOVVZ2Jr7ALa7waB9uJ1kLGpeio4pmX93YhRJa0o6rB7T5NsSQOr7cc83jWagPlXTgMV2glDVgmdspslXONVJdECxSoSA2ma3VpW5cAYaoIYsaw55/vDG3EiJZLooCMTtWejQAoUz+ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723282; c=relaxed/simple;
	bh=h3nh6/m9u27UeyfkIjGb0w7DLjcxbqFubh8HORfNYqw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=TFBmUT8UjCwlE0d1aakyN0MlwToMe/Ho8UwzH/QLPJTtL6oEZCysTqBP5EZngauN9wF/1l81Msi19DGJxdxkX73lzWx/nyJAaABFC5jAnrpeJ+YM0c7s+4yVgZt9VNdWBSIGst6j6vCVz0pmBi8FDaGZNzzBuJQGgKjXsdUHA/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6CvixAg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6CvixAg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E737D1F000E9
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 12:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784723280;
	bh=kEVseO75jFnFJQZ1Z57GiJa1UY+k66y6xQQpUJMQKAE=;
	h=Date:From:To:Subject;
	b=A6CvixAgUV9pCTb4qFZ00UUHYJr48hW5mk2HHRWlQB9q03l9P49Wq7MDQa1/KIU1d
	 02gNqhCaqA6ISaiULz9Z6SG8gmQ+tVT5fLgHsbN+T00+R7b8JFvRo8QSd+0KMqO5SL
	 jKzCahwYgArjKPNPIjO942C3biW9bF5udcsb73zk7y15MhUJpPd9JWxkYjXmy6Viz7
	 kWzSokMRxpaoCz+vB4R92QTFBVPZSCopZzxvL162pnkiFK3AMJuybsCipOKM7lYwrr
	 3LxQwnPqcJwRD4dKzz/JgB21vx7S/SkFYG3c10gAw6eIcwocIA+MYRHcAOwiIb7EM/
	 f9cqkdjgmSYbA==
Date: Wed, 22 Jul 2026 14:27:57 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: [ANN] Sashiko reviews for Linux media
Message-ID: <20260722142757.020b70e1@foz.lan>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi all,

1. Introduction

There have been lots of discuss and efforts over the last years with regards
to improving the quality of media patches.

In the past, Mauro had my own set of scripts to check for regressions and 
do media compiling per patch while reviewing submitted patches. Later on,
Hans came up with his set of scripts as well. Both approaches rely not
only on kernel compilation but they also run two static analyzer tools:
sparse and smatch.

Media ML also receives since a long time ago mails from bots like Syzbot, 
kernel test robot - and there were some other bots as well that sent us 
reviews in the past.

We also added the first CI using Jenkins, which we still use for userspace
tools.

There was also Coverity which is a paid tool which usage is free for
open source developers, which provides more sophisticated analysis of
the Kernel code. Its last run was 8 months ago, so probably nobody is
using it anymore.

Starting on Jan, 2024, Ricardo started writing the media-ci code which is
now used to review all Linux Kernel media patches and merges.

There is a common pattern on *all* such tools: they produce false
positives. Last week we just addressed one such issue on media-CI:
if, for whatever reason, a CI job is interrupted (system error), it
was reporting it the same way as if the patch had a high relevance
issue.

Btw, media-ci also have on its tree a list of false-positive issues
to be ignored, which needs to be reviewed and eventually updated on
every new kernel release.

So, 2,5 years after the start of process, we're still fine-tuning
media CI to reduce false-positives. There have been more than 300 merge
requests for Media-CI since v0, and the rate if MR is not slowing down.

That's perfectly fine, as having bots doing their work properly requires 
hard work. 

Ricardo and other media-ci contributors: thank you for your work there!

So, maybe despite common sense, all CI bots have issues and can
generate false positives. In doubt, authors should use their own good
sense, and, in doubt, check with a more experienced developer to
double-check CI findings.

2. Sashiko

Maybe to cover the space left by Coverity, there is now a new
project aiming to do some static analysis of the kernel code
using LLM. Version 0.1.0 is from March, 2026, so this is
a brand new approach. As such, it can also generate false
positives, and, more importantly, as it is a new tool, it
will certainly need some time to become mature.

One of the strengths of using static analysis tools is that they
are usually better to review error paths that may slip on normal
reviews.

With LLM-based tools, the hardest part is to have a set of
prompts that teach the tool what it should produce, what kind
of reviews are important and what it can consider as false
positives.

During the last Media Summit, we reached a consensus about
start testing it. There was some doubts about who should be
receiving Sashiko's return. So, there was an inquiry with
Media Summit participants later on to double check how
Sashiko tests would work on media. There was non consensus,
so we opted to be conservative: Sashiko's e-mails will be
sent to media-ci@linuxtv.org mailing list without c/c the
patch author. Our patchwork instance is picking such e-mails
and adding them as checks at https://patchwork.linuxtv.org.

Subscribing to it can be done via mailman3 Postorious interface:
	https://linuxtv.org/mailman3/postorius/lists/media-ci.linuxtv.org/

(to avoid SPAM, only members can post to it without moderation)

Archives are available at:
	https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/
and:
	https://sashiko.dev/#/?list=org.kernel.vger.linux-media

Yesterday, Sashiko v.0.2.5 was tagged(*), containing IMHO two 
relevant set of changes:

1. Initial support for linux-media was added. This includes
   a new prompt meant to cover media specifics:
	https://github.com/sashiko-dev/sashiko/blob/main/third_party/prompts/kernel/subsystem/media.md
   Those prompts were generated after a feedback we gave to
   Sashiko maintainers, reflected on this issue:

	https://github.com/sashiko-dev/sashiko/issues/334

2. It should be possible now to use Ollama to run it locally
   using open-weight models. 
   This may help media developers to test how changes at the 
   media prompt may affect the tool. Still, running it locally
   takes maybe 10-20 minutes per patch, and most models are bad
   honoring JSON format, which is currently needed by the Ollama
   integration.

(*) https://github.com/sashiko-dev/sashiko/releases/tag/v.0.2.5

With that in place, we guess we can now start testing the tool.

For such purpose, we kindly ask all contributors (patch authors and
reviewers) to subscribe to media-ci@linuxtv.org, check Sashiko output
and in the event of finding false positives share with media-ci ML
so we can improve the prompts or create a new issue at:

	https://github.com/sashiko-dev/sashiko/issues

This way, Sashiko developers can work to improve linux-media
specifics.

Btw, the same applies to media CI: if you find false positive
issues there, feel free to open/update issues at:

	https://gitlab.freedesktop.org/linux-media/media-ci/-/work_items

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Hans Verkuil <hverkuil@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

