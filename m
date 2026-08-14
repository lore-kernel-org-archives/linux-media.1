Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FB53AEF49
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 23:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786750423; cv=none; b=UdNCPeRolFD9UjKAvL/Ljpn4PUAMiU3DqxnEaXvNIpBnPhTHUqhFtohf8AGBsydmpJoOtKd1nHgWicGQKXMLqHWAAioADRU0cIUDK6ZHilbhWrkgIk9UvAzXtzehU26RvTTWGYkVm0folYuJvAv3OFsMaNSEb19YUyQdKpelwtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786750423; c=relaxed/simple;
	bh=gTvnKda3k7bhjdlJ+DEWnw4iU5AwLz2j9KoiwZAwHaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tsy+qk42CcMG9tZUHmw8dFcU6qVwu/6gVOXhTqA6NRj9OHjd+X1zkAYwiGkaa7xCfH1pAZDOB7nDjWT+xxrJZAo4QDeoI0Xwne9+fKQmYGjdp4GE+eiisjf9AgAV1tmRS4wp10r/he6i2sLfmQ7sbxVzIxxkuWUG5TJhXHcGygs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqtL83wi; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqtL83wi"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81ff017d420so34618627b3.0
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 16:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786750421; x=1787355221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gTvnKda3k7bhjdlJ+DEWnw4iU5AwLz2j9KoiwZAwHaI=;
        b=FqtL83wiFhlBXcFRsLD5XO1RkkuWQ+vbxGUPAR63fL1iVLok2x4lKayJlNjzPGecay
         4won7TXUwwhJQ7PsntbuawvpOHzj0yuXC8BmHM+vrbMGzO0xS9czgY09NFRY92pLQcoO
         SUoFJW/c8poM+dJVtngNXy0n/heqbHljrsmZZkJbfWqW6nPOl0Q1f0drZFt6VPqg3tmI
         /zK5uopE4hClFY5r7FvhGvgMlHJFReDLoWFOFv/aOXE5Pe5Uis1s9GLYcog6z0xIIvXx
         CXPnO910Km6zWp6L/Q7oalAqu2tDjqdLjk2zaMGq5hMJAuxMppA7uWSCmpUKiH1poI0h
         cYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786750421; x=1787355221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gTvnKda3k7bhjdlJ+DEWnw4iU5AwLz2j9KoiwZAwHaI=;
        b=UfB1H39rX5fw5ZX2XaAn7YgfilB9mU3I7yPVNSMKuOMMxT/x9x7iW+9p7D5o42qdg5
         nXJeplLgso0Dx9/g7nEHaToa6o8ktGmUi+7YeWsvfeMlFsFBF1S1NgY+kUvqngDLZuRh
         CWOw4kG1NMw9G0NzxNg4Wlp39FLrXtHXOpbUj7/Eix5BqRWyxnVapPOyXZr33mXmls0G
         KsjnNgemI6f84xWt7S3vZVIsaNgDJWc1BW4paY6isPcXGZyKL7g8+/NvSJQl6CLuneyL
         HD4ZzQ7wW5NR6fAF89EtbBtKaUaN7rhZQ55/+lJPtrY2dhBkvhxsFJ71y+EP6s0T2GbR
         0uhQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnnWk+dImmB8ROrZtLB6PUmniQheQqjG9aaOMWXz0+oAKGjVRoSQqT++J8rvMXUyznJCRksE6A6mEo1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr/ZyzrS+yy9xODyfWGTF3KLfPl38k85v2sPhSiowCzjpYKUEb
	PHRCoU6zNTWY+zPxVyxb+ub89eU/5bB2IBlAOx9KnVngeT8I8lCYJ2MmL/rBm0Af
X-Gm-Gg: AR+sD11FV02b/e2J0YgKXM/Y9jZII2C22o0AMON2r+eZ4ADjiTskldBJf33AfYHJBBh
	/KrRoE1wodWLQgXXPThtBSAKqMfU7Zod/MM/tLRxq765H5NmR3+8Jo5Ky2TLbze2Yq0WrSEO84t
	0QcYjHVWQ8tSZMjxwq4yKwn6+cafrzES4P7wHrja2qINo1DVGaXsN+j5joeWduQ7aPUl7J/e7qI
	gqW5IPtLmflNk5bU3g+mAH+cmp4fP3M3zuI4FZi39TixJTy3O4mR2sTp7/UjQjcT8m85wXwCHUL
	KLfRfPNMHK97OInobA7Kd3TFDBKBxBtdbXdRu55d7Zc8jXRmTcIoNZzahA7IaOpURGUrlp9xLF2
	ViUd/nsy/woQkKhbd1OeVkVqIwBw97BNAHarDVfh9RTwoByZJnfqdfIFS8glT1uJ/uP8T0jcyyu
	06jEVfsz+uda4R6/kxH8ajLQ6Ky8VsLoDb/eAhZFFa9DYzb00gHjVjWmJNSKrGKAUj0D1LyZ/ca
	piT75UfK0KJU6Fwjd/7n0EcBYknuOzwBNpE0r19FYd7lBjDpGCa8Q==
X-Received: by 2002:a05:690c:d8c:b0:81e:d60b:ecc4 with SMTP id 00721157ae682-83489252cadmr74396087b3.17.1786750421310;
        Fri, 14 Aug 2026 16:33:41 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-836bc69387dsm19676237b3.20.2026.08.14.16.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 16:33:40 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Michael Jordan <jordan.mymail@gmail.com>,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: query pan/tilt position from the device on every read
Date: Fri, 14 Aug 2026 19:33:39 -0400
Message-ID: <20260814233339.973623-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANiDSCsS-JJrGMaoBqR-XX54dtp_uQEVVSct-BWL0gQNL4OfRQ@mail.gmail.com>
References: <20260725212332.64927-1-jordan.mymail@gmail.com> <CANiDSCsyVYanm5MowQv5-rGy1EYs080WRsZYJCT=J=SesPFnjQ@mail.gmail.com> <20260731151509.577383-1-jordan.mymail@gmail.com> <CANiDSCsS-JJrGMaoBqR-XX54dtp_uQEVVSct-BWL0gQNL4OfRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ricardo,

On Fri, 31 Jul 2026 19:14:51 +0200, Ricardo Ribalda <ribalda@chromium.org> wrote:
> You definitely have to ping the vendor to make sure they fix their firmware.

Done -- I wrote to OBSBOT on 4 August covering the GET_INFO stub along
with two other compliance defects I found on the device (a control
default outside the control's own min/max, and PanTilt-Relative
returning a constant). No response so far. I will report back if that
changes.

One thing I should have made explicit earlier, since it bears on
whether this patch is the right general-case fix rather than a quirk
for one broken camera: correcting that firmware would not make the
position observable.

The driver clears the control cache in exactly two places --
uvc_ctrl_status_event() on a Control Change interrupt, and
uvc_ctrl_commit_entity() after a SET_CUR commit for auto-update
controls -- and __uvc_ctrl_load_cur() re-arms it after each read. So on
a fully compliant device a host-commanded move yields two samples, both
endpoints: the first G_CTRL after the commit reaches the device, but it
runs microseconds after the command, when the actuator has not yet
moved, and every later poll returns that value frozen until the
end-of-movement interrupt. Under autonomous tracking there is no commit
and no defined interrupt, so nothing invalidates the cache at all.

So the limit is the caching model rather than the device. That is the
case I would want the patch judged on, and it applies to correct
firmware too.

Worth flagging one side effect if OBSBOT does fix GET_INFO: with
AUTO_UPDATE reported, uvc_ctrl_commit_entity() would begin clearing
ctrl->loaded on this camera, so single-axis writes issued tens of
milliseconds apart would start merging against live data and cancelling
each other -- the second failure mode I measured. It would move the
device from one horn of the read-modify-write question to the other,
which is the pre-existing problem you identified and which this patch
deliberately does not touch.

No action needed from my side while we wait for Laurent, HansG or
HansV. I am still happy to respin with the autonomous-tracking case
argued in the commit message rather than in this thread, if that would
help whoever picks it up.

Best regards,
Michael Jordan
