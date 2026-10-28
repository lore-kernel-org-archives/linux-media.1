Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198509;
	b=2AOmrTA2AD4QFLt00Y20B9rXytzqcxE1Pj/cJtmxEyxkJmal42WlJ8QzViRRH6KzeT+j
	 2NWjHOcKtIM8UqpUyy4T8HjDfFxrRG5sDqJEMJDvNDQ9H36eO1uSocio0nq5YFsjBaPn3
	 /ofB/aBG7r4A3LfKkDnvxH1aOoVYd+0FLT7wckVXWB0gGgO4l5dkYs+mpBOuYRN5Jgyth
	 Mqp7COzNYPRrf6SZ1lfkZxIdfYpD+97si84yOoiYPqRJtq1oxouJzDx3IVzwpUZu+rors
	 INghl2bJjLX8juzW7lvE5en08OIJ2fn+BCd1BYKg42ev4ne/TpwvwjZvQhF4FCD0tTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=73JtpGPupuH+D5AFheNC9amEDgAQnnB/wKl5yVL0RHg=;
	b=e0juC/iR8YG37/EgNWvePTBRxLFd9YQNIeuFTF2LdwJx8Xu03bH1N05kRfA5sASO4HQh
	 6kD+oZvUk3SnmLEuprMibt80tihUXIA6SsZV+o7fdhJktzxNRBcrbcXp3FCQLtKBBhebj
	 0Y7t517zE5XM76N+tysLoc0aFL5foiYUChphxuyjbsNJdGH0QcRZEG5UA0jRw91qewywO
	 VUFpr8FtkEX/V3G6pwN9WPhMOz2mxWOf44lQGm5AuBYBdqP4smtjJpQyh6rDhHZJlXuo3
	 zfpzXh88kuElW8QL8XwxHzG1e8FvEL6CSRxml90a/mgywt0RJBVCxy0QRf4+fs2h9vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zekoKMHi;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3F6606A31C
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD3F6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zekoKMHi
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a210470b49so8366615e9.2
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 07:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793198507; x=1793803307; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=73JtpGPupuH+D5AFheNC9amEDgAQnnB/wKl5yVL0RHg=;
        b=zekoKMHiFAceYooqOcegk3TOShzuUT230gmMtvcTvg8CBveF/yQznqNV5B9UfGSloT
         Bm5QSnjbMUaqJPaCgMY/lLOEgw2PgKRJHWLNLaOQjlexklgnmnxP4mGVODLuU8+cjbdb
         injzXJ9dSO/w/tg1VG7OddTfNJF72XtWJspfZ+ptH+IzDKfcMrf8o/apGZp9gwTx9IGd
         419epzcV6D9nGeNwxNlfDh1V31vYP3dJup8y7GZCfmUGskgytF4XLRooXyu7wpbCZETN
         w2lG9SQyTrkdHkyCFqpHeKub7HOX7SBj4UxfLzOjnjMIfLhDBTHzV+o4yuG6CHiO1CyO
         UT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198507; x=1793803307;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=73JtpGPupuH+D5AFheNC9amEDgAQnnB/wKl5yVL0RHg=;
        b=O8F/ft3p7bMMpJtfqVgFt6dgRZ2JlxQ05yKP43xSg8KV5jHdOAC8sPFtRz2q3kzBqs
         5l1JYC6JW3HbkCHj/0B6HYrg3+A5N8y0zVIru8fXKxpgv7dS/IYYPnusnDz/kj+EHZBt
         2+w0KqQjPSxZd5whM8FBVoj9/uR+DWh2f07xh5O6wRwk+tfEiJSN5u+V0eb0blEbjG50
         YhVB8CPx2wIUIy3JvikYV0YdaxmUql3PojEakF/03/fLCbkXhw3d4vYE7g5qWVnqJfZe
         AwepYzQEAN5p6Oenht/PvCeCfaYC7DHkeK6++H3Qx09SvCBpxUPmiTqD0m9bxMludZMM
         kxVA==
X-Gm-Message-State: AFq9FYLe4LsjHUOR26AuWxOkW1oQBWOaUJ0MqJZcQrDXgF4+gFjh2YAj
	itFEUzvL+WxbYTaSBX6xVsBKWYJ2aruVxU4amTYLR6WZmBwI2DDMcNH/WLe6AQNInQ==
X-Gm-Gg: AYBFou1RgPwBaxfSr1FlUWnBwj3BxrOli2eeFkhE9YnVA1+nN839p4n6EKnOlXbaQeU
	FsHwtJEGrKFv1A11A/sY86nbY0oRnGTasMiC4dMjTciOj0so/L4zu1gXszRBIwnZrJI4CdKDdvX
	PeySnEVSYNOUJ7NdiZhM1xpFWFaGgyHizAR2XtespcSQqHiZBlmb2/EgpXuLLMy7Mj70yLKhaNC
	RkeS+xeBpM+3Tu6UTT0aoQ5BNZl6NueLSvcezCOHaDyLUJRzbHG0iLKCxFe0w64yd8IiHZMXoky
	YF/OpMIORLQZTWRaPgD2PdP+eQJD4BAodlW/IhhxMi+/c0rauw0cV6jPUtiI9hXt+rYITJp/y2p
	QCmlmipsOss0bTQ0kP+QypDP7+nZUEsVeqe2BIiQtDV+cW+hHQ9eCCVj3rforyHLHNX7oK3LrME
	pAeFqZ6cTy9tDQdcasrJ4BIMY8XWW5vA+NvgGem5odgCmMQFyHgq687sujxONXFdEs/yaDrTmO8
	SXTX8fNQFIF3TvJAR1Izbp3kQ9ZgxWSCDaP9kg+Kr+z3JlicpRyPSvT0WkxWTBf4nAj24sCM+u/
	tSjR8u4H8fdmAhO+JGJtnA7gvPmlahiPmBK1oG4uzC9olgRtndy1K5yrZmA6byiyTxpQSLa4UZq
	QBxgac6QYm0jN
X-Received: by 2002:a05:600c:6098:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4a9640f2328mr53769625e9.1.1793198506985;
        Wed, 28 Oct 2026 07:41:46 -0700 (PDT)
Received: from [127.0.1.1] (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece13aasm26848499f8f.58.2026.10.28.07.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:41:46 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: linux-media@vger.kernel.org
Cc: Eduardo Ruiz Duarte <toorandom@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans de Goede <johannesgoede@oss.qualcomm.com>,
 Dan Scally <danscally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Fernando Rimoli <fernandorimoli11@gmail.com>, Sergey Lebedev <lsauz@pm.me>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] media: ipu-bridge: survive module unload and reuse
 the software nodes on rebind
Date: Wed, 28 Oct 2026 15:41:45 +0100
Message-ID: <179319850512.1175157.6497185322070247884@gmail.com>
In-Reply-To: <20261026082549.662885-1-dmanresa@gmail.com>
References: <20261026082549.662885-1-dmanresa@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hello,

Eduardo, Andy, Bart: an apology, and a caveat on this series that comes
out of your thread.

The cover letter above says that the asymmetry underneath 2/2 is in
drivers/base rather than in the bridge, and ends by offering to send a
fix for software_node_notify() "if it should be balanced there instead".
I wrote that without noticing that Eduardo had already reported exactly
this on 11 October, with a reproducer and a splat:

  https://lore.kernel.org/linux-media/20261011131518.48838-1-toorandom@gmail.=
com/

that Andy had pointed it at the core two days later, and that Bart had
answered on the 15th that it looks like a bug in swnode.c and that he
would send a fix proposal. That was on the list I was posting to, eleven
days before I posted. I should have cited it instead of presenting the
observation as mine, and the offer at the end of my cover was redundant
with Bart's. Sorry for the noise.

The analysis in that thread still holds on current mainline, for what it
is worth: the code it quotes predates c393ef0741d4 ("software node:
provide wrappers around kobject_get/put()"), so the calls now read
swnode_get()/swnode_put(), but both are plain passthroughs to
kobject_get()/kobject_put() and nothing else moved. The put in
software_node_notify_remove() is still outside the "if (swnode->managed)"
block, and dev_to_swnode() still resolves dev_fwnode(dev) and then its
->secondary, which is what makes the two sides unbalanced: at device_add()
time a device that has no secondary fwnode yet gives NULL and
software_node_notify() returns before its swnode_get(), while at
device_del() the secondary is set, dev_to_swnode() resolves, and the
swnode_put() runs.

Now the caveat, which is the part that actually matters for this series.

2/2 depends on that imbalance on purpose. The reuse path keeps the
reference that software_node_find_by_name() returns, instead of dropping
it, precisely so that there is something for the unmatched swnode_put()
to consume on the next device_del(). That is what makes the count flat
across a PCI remove/rescan cycle (4 -> 3 on remove, back to 4 on bind,
over 16 cycles) rather than losing one per cycle.

So if the core put becomes balanced, 2/2 as posted leaks one reference
per remove/rescan cycle and the IPU node is never freed. Eduardo's patch
is in the same position for the same reason: its fwnode_handle_get()
before set_secondary_fwnode() has no counterpart once the core stops
putting what it never got. Both are compensations for one core bug, at
two different sites, and whichever core fix lands should take both of
them with it.

They do not collide textually: Eduardo's hunk is in
ipu_bridge_instantiate_ivsc(), on the mei-csi device, and mine is in
ipu_bridge_init(), on the IPU PCI device.

Sakari, Hans: given the above, I would rather you did not apply 2/2 as
it stands. 1/2 is independent of all this and can go on its own. I am
happy to rework 2/2 on top of whatever lands in swnode.c, or to drop it
if the core fix makes it unnecessary.

Bart, if you have a proposal in a tree somewhere I can run it on the
Surface Pro 7+ that produced the numbers above: three sensors on IPU6
across PCI remove/rescan cycles, with a module that reads the node's
kobject reference count directly. The machine is being given away in a
few days, so that offer has a short fuse; after that I have no IPU6
hardware and someone else would have to.

Assisted-by: LLM
