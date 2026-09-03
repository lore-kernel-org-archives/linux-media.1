Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8848543E48D
	for <linux-media@vger.kernel.org>; Thu,  3 Sep 2026 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433686; cv=none; b=Jjo+8iCNZV+njo0wBrnlMygrhi1NHtTSwVgwJjuu/qx31MUkP/M8C4yKvCmH1B7zCcWjzQ2TLm4hFzzzqsiaiRaYAsSgfM/PngViOYgCxRYj3WGZAUpBXqFCCyrMDAx8+eEqEk27J5Ew8NU0NTNJ2sCnycXV8pBD/OXtfG5Cv+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433686; c=relaxed/simple;
	bh=rvqfTzgF9DKFA+Yqp28q1VjR4vNSXYyHAnl0lXZrYB8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s6Bwl2yBnhalY73t1d6yrqT4a1gcooSW+L2NqHtz2gnP3gAgMAq7cp20yNsJhzLVkXJG4u3dg9L2dBbFluZtESZVXnnhBYJqmFZHSK7niRCVdVgV5WHapHDz6YuI/obR+aSB9iZkPbSqghNCAZIrUeMeUiBnv9qyUIFWlEyVC40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhg/cmb4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhg/cmb4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso16509635e9.0
        for <linux-media@vger.kernel.org>; Thu, 03 Sep 2026 04:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788433683; x=1789038483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CaxK+DYJmfoOuwo2W3mmfOdgw6rS/SBlQdw3Z3QKNfo=;
        b=fhg/cmb4CEhcMhNc1UVyMeqIZt2ScWuqrUtYFHJjRtzZxVHkVDnNFA6dib2vRuMns1
         aXBCJM9cbZeVvQSJ5WamyPOAL2mlqJlElhULAPV3rM4AzBAZByiHh7lL9+J+mAjbdRPV
         UcPTAvzEKclChA0lEv8klicIXdbeNq78YgKHFNngtAOdQqGZsL0XWn3SBF1bC8sMD0JB
         VDXVYyY1cK/vM3wtxPepsEnuyHIYLHoFNHqbWFEU94NK9DIaSgCjso5JpDIZ1yq4b1Gn
         DyWQ/1NUHIDEtaV3kt60mt2MCGB0Nr0ZJ57rUt9dpcyA67Q+K748wIJXPQ601BYYh7OS
         BMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433683; x=1789038483;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CaxK+DYJmfoOuwo2W3mmfOdgw6rS/SBlQdw3Z3QKNfo=;
        b=CmzfzibatkbJRN2xgexXChbWAV2VfaI5fevx92FLqGi21cnMymVLW/VJiL9KsCVxiY
         VUsyFp93rOdfTci8Y1V8kyyFZNyvTT7Daxp81tkokm2ooEPV/Uo72XE2Lztb6uLLWoPu
         XEYRxuyS1qZtpYjxWBGZE3JRudFzwEuHFgGE/PjyxWGBdJCMgfQwfovYKXIttayUQO6r
         Co9Gnuld7LzkE7TkMXU7i8Gxl+eTZQyv7A00Ko3Anv7jjw5l5w9Eb7f8j3WQk6e/hb3z
         0GXzArMn1MDkzdjG0nOJiN/MNzlWQfppllo1efrbqg6HRfUWtsQy3ITmR1mSAYWF7XXw
         /EVw==
X-Forwarded-Encrypted: i=1; AKwUvBxByAqv6vB9/vPKXbaplIKItcK2HHRtQp4bQIh4ZXf05B2FAmVDM3xMSxIGcHicYtU38t2tCA4zS9Q4KA==@vger.kernel.org
X-Gm-Message-State: AFuF++lL8OvyJM+8ozi+u8d4v3I1RqygctgEP/rVJGw88wdPE2nlRiEW
	ht+FbNJdUmGCjXsWoz2Pl3S+wEyZow9ytmgJwEUoPootyIr7aF8BNTZt
X-Gm-Gg: AYBFou1JrTBO2AyTkvroPgrx6t/Efy5DX/bvwT4aS0v9fpCneI28PBTFUcOu1qSfvVX
	MCaRggRr5aNMzUUVw/E/WBUfP2JGq77A21+NmK9OS49E66wi9yDz+vHs7PdaQl8XcjLjttxBQx6
	8W7mwwmFF7mBnEBhC2nJyYd/KTJ8D/GzXc/BX55BiE6unfhgTQFpvvjP9sXwtyvmOxUSN6slTfD
	vRGT5ej0L0tTuwPjpxW4HBK5rZbtvi58+A6sTOBOakw6CeYh3pGE788/1HkyUwocdhwW3ZkVvi8
	ZKzqf0EKrOAOjutBsJv04uB+TH4KziEcLrP+RR9sJxkCNtyp/Zv7J1q7tpM36cfNJeSSO0b9Jjr
	Y7QN6Q987LsqBn/XdUfkTjpSGRFf+9n/Ld8h45xyhw1UKvtRdM7bhppkoiG8E1Q3ueMUg1I2tP4
	isibPUjR06Fx0pTMwKqCCwnOkDnm/uXS3N0bn3EGZr9UpAcPsvclRdAoeWwDcwyzkDrzCckQ==
X-Received: by 2002:a05:600c:4ed1:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49ce582984dmr169781305e9.16.1788433682585;
        Thu, 03 Sep 2026 04:08:02 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea5b4sm13400768f8f.27.2026.09.03.04.08.01
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 03 Sep 2026 04:08:02 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:07:57 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: syzbot <syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com>,
 bolewara@gmail.com, devnull@kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org, mchehab@kernel.org,
 syzkaller-bugs@googlegroups.com, Daniel Mack <zonque@gmail.com>, Takashi
 Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: DIY allocation or embedding of URBs in larger structures
Message-ID: <20260903130757.0668310a.michal.pecio@gmail.com>
In-Reply-To: <87o6ee8y9e.wl-tiwai@suse.de>
References: <6a6e9502.f794c993.27aeb.0018.GAE@google.com>
	<6a97af8d.27a413cd.1e878c.0004.GAE@google.com>
	<20260903112417.21b76017.michal.pecio@gmail.com>
	<87o6ee8y9e.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 03 Sep 2026 11:44:45 +0200, Takashi Iwai wrote:
> On Thu, 03 Sep 2026 11:24:17 +0200,
> Michal Pecio wrote:
> > So what happens here is that USB core continues to use a URB after
> > completion to implement things like usb_kill_urb(), so URBs are
> > reference counted. Then core decrements the count - one more use.
> > 
> > If a driver waits for completion or even usb_kill_urb() to return
> > and then proceeds to free the URB's storage, this becomes a UAF.
> > This driver embeds 2 URBs in its priv and does just that.
> > 
> > A URB can only exist as an independent allocation, core will free
> > it if upon finding zero reference count in such case.
>
> So, IIUC, now the URB *must* be always allocated via usb_alloc_urb()
> and an embedded URB isn't allowed?  If so, we'd need to address other
> drivers, too.

Yes, that's basically the case and actually has been for a long time.

The only thing that works is for both USB and the driver to call
usb_free_urb() and whoever does last will actually free the storage.
This means URB can't share storage with anything else.

Some drivers got away with making URB the first member of a struct
which is freed together with it. AFAIK this pattern doesn't crash, but
it's deprecated too because it puts a flexible member (in the URB) in
the middle of (the outer) struct.

This pattern here in caiaq has always been one race away from UAF.
Maybe it wasn't very likely to happen, but stuff like PREEMPT_RT and
hypervisors can insert unexpected delays anywhere these days.

Greg KH puts it thusly:
https://lore.kernel.org/linux-usb/2025120716-sway-hypnotic-8cb6@gregkh/

Reragds,
Michal
