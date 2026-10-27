Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124905;
	b=gD4dv0uRUsqlP5w9jI/RBYBjIdrSwRcLQ+v5bkIL1PdzB87GfEiiDrX2/3+FzDwzIUF2
	 V7Jtf5Fay9QfmU+za2sNe3JG3Ve7wVV3YFJuN5E5KNER4Y17pe9DCMDEnqH63GT8Lvuxx
	 0lYGgRdlNd9FpYT1pSWjGa11aVwsPZmK/qYz8cMA9Al0iQ/P5cX1lYcq3+0cL5f5J7aoi
	 1wBNELw97YEzDT0aq/SHQD3bCbZAaoHze7DF0bjzHVHMxndMhs5DrR74wdQ23Ao0HDTEs
	 zmN/0LxJW2aDvu+aIkEK3mBp1UtNlXlfSfj871z8GdMWsWdwvLHKiKC7dbIMNz6gjsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124905;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:From:
	 To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=a1Ja3qIFPRW5o1f0UvkP2WWshxKnpvUF89aERI+066U=;
	b=mhL36zVRZaGdzoO77vrlyBJ0KM2CCWnbkfj59ISZ9dvjUzBwBOWQ/mwVPeVwMu17SLVn
	 v6AdkNa9v6RMbtDIrp32h2DsSkNV0dQ0Dh2pQ4Vx5ihy2n8seBvs8qP0JVzxESOltjPTq
	 mw+v0xIMGDTmoqtMNGWJv5a/DQBicBIOrRYguUDxBj7mmv6RkonrPeJXs5xJTmADS7jZi
	 acO3/jX3hdbjsIUsh7i+eDzNo+8xj01saBh8QEcm/5R8vyCEtPcRNpDztkyea4ToHg5Jb
	 thd80ibK4V2LpdpgLwFnCnGIWD0+DZB3cfio39l12q0P7JhF88qrUSoTWD8WE1wX3JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B21E606A324
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 18:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B21E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so1897655e9.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124904; x=1793729704;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1Ja3qIFPRW5o1f0UvkP2WWshxKnpvUF89aERI+066U=;
        b=xbResEO0pYyjw5a4sKsUw1mQupUTlphIBkBZcMoNM1DnUNubVXLgf9bP4aUprzXIRn
         1HL5qC8WOfqkhtPTH0FFmo62D/EOZKKgVVIRkh44Vo5qkNmNM4r04zwfyaXfrQo5O3pv
         18Kf0W6Y55AwXEqa/GB7dNQJZD5DxUiF5jDlM8ObSJaRvz077g+jd4ho/8/q6QXjRS19
         9M51F4TV8gVFoUi3798Z1mFciDOcA2gxX/6kijtUK6nonEhp4KLHHLxMxuDKlunqabOS
         7y1qSe/rbTpnQ0bJPNhOO4/fNoaux8WnYVNcdmtRXlnozU5/XixJP7DllFMgme3omPBR
         ihDg==
X-Forwarded-Encrypted: i=1; AKwUvBwW2SoKX+u2plg4XWBSLZo2PQ/tI9GYtEgsVFQ16P2UmHCn1GN0bCSJNdcsU7c7GQmA0Mrv9vFLlvNZkQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLeaK+jao0apMZk0wOcKtZE7EMvjp5caPNczARCKTyvW9gEf+DS
	z3toA9dTKtqWV81JVFkAsuLKmroy+Ojie57fTvNH39i5kVDW2mH1vQkD3reYQBoG8A==
X-Gm-Gg: AYBFou2NTF8lkJOy0A1c4iP5NXgIsYcrkWC8UaYBl7DIJRANF2oUnuwK0k7Iu+gzMFC
	M1ltaT3CyVdG/cQ7Za9T5U6+Dn0R/LGc8e9HPpRxN14bJF5VbiW/D4abOMugKYR7IlSdRoXvPBj
	I/fxWlpaJYVNZQt4vwsv4D+TXVgCzgIgpu9K1Khpg/MfzS9mKV0IwdZWGO4P6oM8RDaKPrzegJ3
	kawSqCB57i5BG/+b5DEk55dUU0uL915upestRK+sA8WMIyJ7/Cgk+ZaP35Ml5bBDxUjPISRa61v
	Mc8KISlwP0cLZOJd47g2lUNkv1RJIn1tMEqmh5V9FBa6Kd4yWYE0BzB8PSn+XEkByJl1jFcUGr1
	9v6BrV3gDb3Y0sT0ii0n0L4OuoRD+ssVxJTdHD2qdBtHynPiSK3yo3XWHT0bmbjog2GD4IBD8Em
	VBsvqnrWGhMghHA1tgQ3IREi2J23tTQXnMmsTLj0NmKN9dStppevXS/MNQBz0RZMl3oZSSVLzgY
	Sj4HqAufqUE7w7x0JW9KF9AuIrPuPLtcC/PxQ7VjvjUI7cUKsvcw9WVqX1yil35ZMnMbq3kaYYx
	/DnAtZRVhwLSQZMU30qJRN1/5k5k7pVmlCxjt4Q=
X-Received: by 2002:a05:600c:37cc:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a35acb990emr210145325e9.33.1793124903858;
        Tue, 27 Oct 2026 11:15:03 -0700 (PDT)
Received: from [127.0.1.1] (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94c118e19sm10345e9.5.2026.10.27.11.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:15:03 -0700 (PDT)
Message-ID: <6ae0ea27.08a8f783.2e4276.0395@mx.google.com>
Date: Tue, 27 Oct 2026 11:15:03 -0700 (PDT)
From: D. Manresa <dmanresa@gmail.com>
To: dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org
Cc: antoine.pichot@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
 dan.scally@ideasonboard.com, hansg@kernel.org,
 andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 1/7] media: i2c: ov7251: Fix link frequency index
In-Reply-To:
 <CAPY8ntBFJJPg3y46gC=bNq_55QifC7mKmeq8+pAEDVN42fGUXw@mail.gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
 <20261026111032.88355-2-antoine.pichot@gmail.com>
 <6ae07c65.e52dcaf0.293af3.e7d5@mx.google.com>
 <CAPY8ntBFJJPg3y46gC=bNq_55QifC7mKmeq8+pAEDVN42fGUXw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Dave,

On Tue, 27 Oct 2026 at 16:50, Dave Stevenson wrote:
> @D. Manresa it'd be worth trying using a prediv instead of (post)div:
>     .pre_div = 0x04,
>     .mult = 0x85,
>     .div = 0x01,

Our mails crossed, and that is exactly the change I had just finished
measuring, from a test patch Antoine sent me. It fixes the link on this
receiver: thirteen 150-frame runs at 30 fps, every one 150 of 150 in
5.2 s with zero dropped buffers and zero CSI-2 error lines, against
seven bad runs out of ten with the index fix alone, three of them hard
stalls. i2c readback mid-stream confirms 0x30b4 = 0x04 and 0x30b1 =
0x01 with link_frequency still 319200000, so the link rate is unchanged
and only the VCO moved. Full numbers are in my other mail on this
thread, which went out a few minutes after yours arrived and does not
mention you only because I had not yet seen it.

So the 19.2 MHz / 319.2 MHz mode you could not test behaves exactly as
your 24 MHz oscilloscope measurements predict.

Dan's instinct in the parallel branch was right too: it was the
driver's PLL settings and not the value ipu-bridge advertises.

One data point on VBLANK, since you raised it. With 2/7 of this series
the 90 fps mode runs at vblank 92, and in its clean runs it logged no
CSI-2 errors and no corruption I could see here. I did not go below 40,
so I can neither confirm nor contradict that part.

D. Manresa

(Written with AI assistance, directed and reviewed by me.)
