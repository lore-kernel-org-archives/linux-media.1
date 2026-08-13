Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B403F331ECF
	for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 20:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786651599; cv=pass; b=V5GcU2+D5ZpmQfXJoC3EGhcLmyJaEZYFwZlUBrWi/CCLFeFOYoBUttk1GdztMK6CKojRyumrGB1qNpE6DfrKwPeUVVokXZsNepX325Z0+x4zf+BLqcG+NDwhBtJ245mOAnbUPnSq59cvJQ9+TK7jmBO3lQyuySokNQDKlrhL6Qw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786651599; c=relaxed/simple;
	bh=VPsgI3uJTALt2+EuS9d8czPSYBg+/pn8ACdYiLvO5rU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HU1gtMuR4HoFT0zu8AplTtf1eLcsdiw+Zv6aUDogFU+m8E8OAqeuPdUnLqgb3JMWxddBmHd8nUy055nYcsLmLRaGs+Yc9Jy5XeopwkiSli5ILwnikgblzOk4iDLlWAWtbMdj40ERNIjii6Q8mUAnBB+chH77CnEgdTm0mFQmBmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckcf4aBo; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckcf4aBo"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dd1cc8dc8so27698a91.0
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 13:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786651598; cv=none;
        d=google.com; s=arc-20260327;
        b=D8K0dRx2dAiMeN88r5egJrBi/U3EKUWNwlohKWX7cgaZHWbn9H2h6lJ4rpyXYq3quR
         pzHWOxwLUBJgkbM9b2CXadcRImc399t7q+/SKeQTt5TMSvx14ShIWwyeGSHl5/WzXjcU
         5Ujg9OfQ1Yh4Ps0lgGXb95wse5EXK53mPDRHqBOZzfGVpvrSGknm6kuLhOM9P4ZST1+g
         USVsWzFo44p3DfLRn3cRfGGzNuvw8UeZnoy0zVuB9LqvMq34VhFXk0A/8RIvCYLy1WrR
         U8ullXotVGDhna7e7+ij1kCgCIgWIkLDRxoIRoXGTjs1ri7EP/JbH2pLTrFWgJo4lPKq
         BuVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NrDY9sHqJ/BvNZ9jxPue3aREvcMXvBmJ3pnl6jN9+AE=;
        fh=E3dtz1IdjRThtQzBeg6bZ1d7VKLt2GSiJ7KEQwR//LI=;
        b=VPMEEQ3UJWfLFO29Ld2ZqOhlYwoGIlG/Q4age4/SbBLsXwbs1ODtwTId72G4yOjYpE
         psTD2ZQnwiie5bq0K23uEfSXWT/dq3NP+V7wiUQHhUhjgATnJbEADRPcTBs0HOd3TmDt
         J1Jx00br5+5hhTCbB4I3/fwWfIuhPc11KCE482fAJmMcfl87JTKy3SfloEy0Ooa20vuY
         YpnM5LXlQwpc9Dke61IT4DlU/LHcRb6r5WOOCYQ8rVCn76H5mAP3nZ+Cy1yscp5laMBn
         LJG4O/3w+5PS/wA0Ig7ngbKsBjyH/bs0Akjhkzpf38GusvgsPJXBYtyhyVB6s4HPEFDu
         hTIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651598; x=1787256398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NrDY9sHqJ/BvNZ9jxPue3aREvcMXvBmJ3pnl6jN9+AE=;
        b=ckcf4aBoIuZjsaJSeUu3OtGYuTyPDVKQcBh4AOwWVnLcla6jz5l++IpQ6VsP7tQzvE
         yPj1tWCE1nKG/LzYzcm13Q45M87hugZzmsoaAuekvVh68xQb6brSwaCLqOlwIZ8aIrvZ
         ir7lYuKaCvh3Q3/En6NsaNmDTagE2C0vXgKbBc7rLDWLC1WjzfWHGOwytUHrXjwnnn4U
         RAgFAqykEn1SQ05XY0fsQWFpAwhp27u2YY3kXjkT0S12KZfp+u5rFNyd4X3ewpiGKDnE
         rcbIKJIhCsd6Dx2NXO9WLXBgiAWPv8FmHeF7+E9HBKnFvVuvxLNjyrQjtNibS6cIigks
         atiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651598; x=1787256398;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NrDY9sHqJ/BvNZ9jxPue3aREvcMXvBmJ3pnl6jN9+AE=;
        b=EdsErUdvAtzvuVfd25wVXL766dj1tGpj6wdzu0fHB0eLM3l6yKy1kI5lVHphda3oMr
         f85xp/hVK+RswFyrcPGG+U57/v2ZF8oyt4h9RTjo1VvO5qDTxwQ9DEgizmLVW+rGtUss
         hOFKHvubjmjjztToql7b76EXgpy7e6cy/sDWAhx/o9zskDf6nPERki61x1ugPjmnkt/w
         LfKPAsihvfE5BrKPmWsi8oTBPd2RWtJOkBwu6+vwPxGpSMfncLljBxMrr9I/nUPMlelg
         FSRu3XJzXP9gBn8guZoLmiaOYq7JUC9EfPAFn/FcKxY2+FST7+G+K/WuXC8L2Akesn7+
         jKXQ==
X-Forwarded-Encrypted: i=1; AHgh+RqEQjbOWeKzFqSpAD69+9RvxO3raZPX8Ssq+6X/ZvfBWIqMQciH1NYHpWedwZ7x0OFkmc8XSW44mDCMhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLtYrBu04mojT7XcTNVJ8i6fylU4pesVjWKtbR0Zurfr/UiSlA
	0D4DjiCtRbUWGkHaEk9bSyWJt1LTtDx9wbM1T5A05Gu7DzrUICLaaV+m5IYEefRzTWKzCXldefa
	6mZ/I/3YNFBYgWyJbdvcMxAqBxL9+4Y8=
X-Gm-Gg: AR+sD117WrwUQQuZqd7l357rT+aLxkTxYBRZGEQ4hysXmS9ADQk6o0P8BpxuQOVocMx
	sXtP7MKK8JyRBeifug/5HuhUtlGxVrg1A4g+SauNvUB78eyBAwYZeBKwOVgTuImm91Biutyz2nL
	pDFg+XpUtgyl6c8j7YuHtk+/fw5OSwLjadrw9Ywnx9pk57k/car9elKTDMVOL3oQLGPK2H3Z7tl
	03OekpNOq8Q52CN95me5EgvI8it3JEQTHZnjnROssHR5iCGNA3OXnZdAOfoJN8U9jxutz/WtXDG
	xU5mGadebYqXDlpYK1YU5njScmiXAc2HKuP1jo2iYto3FOsHnSTLiWAnKMdMSZ45SJ8FvXbtKwv
	XolJ/z/0rezW2eolBiaZR0sv051eE3Eg=
X-Received: by 2002:a17:90b:3142:b0:390:af7c:fe5e with SMTP id
 98e67ed59e1d1-3933e5e1b69mr272474a91.2.1786651597929; Thu, 13 Aug 2026
 13:06:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811231351.1011244-1-taimuraz@kaitmazov.com>
 <a505f9e5-b416-43e9-934d-c5c29b8a70e9@amd.com> <9420bbe5-46a3-84be-eae8-596bc42bddac@amd.com>
 <CADnq5_OR5bFoFJoMoj9bc2_f47TunVnDFrmA_2tT+0k-DZk_jw@mail.gmail.com> <20260813195059.149991-1-taimuraz@kaitmazov.com>
In-Reply-To: <20260813195059.149991-1-taimuraz@kaitmazov.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 13 Aug 2026 16:06:26 -0400
X-Gm-Features: AUfX_mwH-or38BS_oUcXJwyrUvpLFXovJkb8CFPGz9kcSXiCqclCgO7-cgMQ9XM
Message-ID: <CADnq5_PZxoBKqsg6i0eN-wkOBF3UrEZ2cVkMAtgzVD7Kv6ZSDA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] accel/amdxdna: honour the SYNC_BO range
To: Taimuraz Kaitmazov <taimuraz@kaitmazov.com>
Cc: Lizhi Hou <lizhi.hou@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Min Ma <mamin506@gmail.com>, Oded Gabbay <ogabbay@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Max Zhen <max.zhen@amd.com>, 
	Sonal Santan <sonal.santan@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 3:51=E2=80=AFPM Taimuraz Kaitmazov
<taimuraz@kaitmazov.com> wrote:
>
> (Resending to the list -- my earlier copy went to Alex alone.)
>
> On 8/13/26 21:54, Alex Deucher wrote:
> > PCIe transactions from the device should snoop the CPU's cache.
>
> That is what I assumed too, but it is not what I measure on npu4. Leaving=
 a new input dirty in the CPU and running, the array computes on the previo=
us contents, each out of 20 runs. Flushing that same input and running agai=
n, it sees it - so the data does reach the buffer, and something is not pic=
king up the dirty line.
>
> What I cannot square is that ubuf maps with dma_map_sgtable() and nothing=
 else, and on x86 the DMA API no-ops the syncs, so that path looks correct =
only because SYNC_BO clflushes on top of it.
>
> Is the array expected to snoop on this part? Happy to run whatever would =
settle it, or to be told what I am measuring wrong.

The snoop should be part of the DMA from the device.  By default PCI
devices are supposed to snoop CPU caches, and there is the option of
doing non-snooped transactions if the platform supports it.  It
certainly sounds like these are non-snooped from what you've said.  I
wonder if there is some device config option to enable snooped vs.
non-snooped DMAs?  If not, then either you'd need to allocate
non-cached memory or you'll need to flush the caches appropriately.

Alex
