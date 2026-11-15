Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765259;
	b=hICTtJWLWojQyhR80hfmmn4CEKaFBVAgBExq99N73CSqPriSDXil8yjGvXR8RZ94ClfI
	 jrwQ2oQHxFWhlyxpDwVVJQnHdbkaHaxi0DvkzIJ1eP9PGL77OqDQPE7alcG2smbderw6T
	 iBjiwCFGl/eYP6D8ZHgZFJXtrPKtILVbwBJZqa7pSvbjcDn15yR8TnPWiy9cwE6I0qfeG
	 BanazAfhJ9aoe704mX1Hr3uM2e49uMx8M61fM5YWh6NIuhOwg1eXiOZzGuOzOtnvWEq2E
	 FaL9T46EttCWiruIol6oFJVlFUdhTDKnTlhzw7lFBvrnpyrDSSO3/LsCFDKJPEyRfPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WH50qcru4lH7jJgNPK5UULmwPcjOUvxOy1ArP0lmGDk=;
	b=hqqOzwLw7vmWw5HkjK1xQqr4DhxNofYl0QsFI4aZyrrv/CoEJm7u+xqfl4xqtnbgasVQ
	 AfCEvndVesmdh+7hFGww7CfCwB3r0su0egr3PJv8L+nNfvDKuf2YnuzdTdrZQ3CncVadc
	 Em9wAdNBI6399Et3W4c3bRX1+zIujiAf2toe9p4QIHxVrU1CLeCAM9zHVnmcF1YYqKban
	 zfCvhkV4Nn/8nORdM+4qVD8JcBZ6B+VPkKHJft5EUXRBaah6Rdgaw5AZ6sIJbub97IiAF
	 eHRZ64xl7BDPAqoOwsKI2NNZYApqKIJp4aGgsuvgypq5hhsPWEB95664LDc1Oh2vBkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YbA7zYvq;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C900C606A31A
	for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 17:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C900C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YbA7zYvq
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49412eb1474so1251458f8f.3
        for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 09:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794765257; x=1795370057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WH50qcru4lH7jJgNPK5UULmwPcjOUvxOy1ArP0lmGDk=;
        b=YbA7zYvq686UdE0NPHvgJcA+JgUYh9MyUp0CrhM6dgQ+w86n+navpOZ8DpLzZHfTYv
         occXG0IHbca6gOxdisdSbqHCdZO16U2QcH8BA+O7ioQqXRFk/a/MHE1AbJNL6xJ8+miJ
         wfNy0bdbOqo12l7YCERwWREgMW+evwNI5wuOGpggIhFh/jl0OCBlHvg79mNbrIMJIIn0
         m7sFswf30FJbNnMBiFralB4hpjeYeQGiUHXyyL7Jzq5l5jPDrbzIrYqEXcK4Oy0rjqet
         vBPChryx55V728F6mMHrnp6s6WrNAn1ehHnLGcZyZBmjCzIYFcgbwF6Rh6WjM38a6h/p
         5H0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765257; x=1795370057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WH50qcru4lH7jJgNPK5UULmwPcjOUvxOy1ArP0lmGDk=;
        b=HZZVxX08qwlZUqqAcspRbEWvEhQi2dK44YyOx384pF1foDX7p4O5PjhzmbPiKQnt8v
         4H8sfJ/m4VTzxFt0mOdmbgT5uX98euCq/wUTlZo4Mp6Ao+UeFD7fc41j4sqpK42JV6Xd
         JP1pDODCKkAn5i+DCVTXWGttvCukMrKNT/jTYNRPj0GzOL+s/gGnrAfTnOZnclu+QvxL
         d65obPZnHFzUrbsp4ya8LoJvmvGrLxj4iek2Cyv3FIUw7mtwFNnAL7l3HAcsoc+2wC8E
         pRTgqGwtIprnSBt8WrmYM+GNHdQIKwf8qHS0FWrGR0CCcz4v6Rf4o+b7VneXpUOYZo6e
         K7CQ==
X-Gm-Message-State: APuU4Z9vzWy+TdNBrWhf+VYvgI57WfVrrPdEz3ZueoZ/d5RK9ZYS25DI
	GsQ2NhgqU67LTAPgQSNjh9+Rrn/jilByAIch3obcTcOYcpti7mFAP6Sk
X-Gm-Gg: AYBFou2LlqVsdwz5GRKLpaKqh3JjHjbi2u/2S44NIW4/2uSI3NF38tTj5E0RXs0Rbti
	uOjEk71F1Ym4wuqN/0tE446UbPelSXkHcLbn3DZtNgBQOT8czU/fkk7snTAzQOCPEcVa8VV5VON
	oyMJ4HpEUp2XVm/DcgGkcZcwy+Proof/n5xbrhy6MFP0ihTn6PknhYBIf13SehB4KrLOHSrCf/D
	6l82jbKdXcLzDxJlFZUPCjxS/Hx87LkL+Ykhfeox49mQKSgvHIvA3IHaipMM8tUJFw6y9pqv/YW
	X1sy09qiwUCCu2+KWy89oKeUN8z1zEhTyB/0zBvHmJbqSJQS8B63nnzYlypgnq/tOms1dbeJ0S7
	M0k/awIbeRoQ7r2AuXS8OLxCgYGBZo5CNC79r5rbgdrafZ3zUZfJy7J98WNwZIDMS3RnzaDQGQr
	rZ9hyxETFukggGVXD8YaoK6a6jw1nCOl+dyky6YxnFQlUVkiPw+dErBLLL6jjRaZldJczFxUG70
	9VudTIDec9RFQchKw0IPDGDYQImZw8KYUqQm0CCd16JiZhHTq9tc8FBEnuaB9JBGUMqvFAhj8pz
	kOF4THunNXtCLCq+fqwmVLcDbRaSqtnR0b0i2TOawCppdHs=
X-Received: by 2002:a5d:5f91:0:b0:493:d5f0:4e4c with SMTP id ffacd0b85a97d-49c723fc45emr17990491f8f.23.1794765256948;
        Sun, 15 Nov 2026 09:54:16 -0800 (PST)
Received: from firas-surface.home ([2a06:c701:9f9f:6800:4b81:a189:67c3:a27d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d7150529dsm12313385f8f.51.2026.11.15.09.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:54:16 -0800 (PST)
From: Firas Sharary <firassharary3@gmail.com>
To: Antoine Pichot <antoine.pichot@gmail.com>
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	dan.scally@ideasonboard.com,
	djrscally@gmail.com,
	dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/9] media: i2c: ov7251: fixes and infrared strobe for Surface Book 2
Date: Sun, 15 Nov 2026 19:53:01 +0200
Message-ID: <20261115175301.8516-1-firassharary3@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113024059.1087031-1-antoine.pichot@gmail.com>
References: <20261113024059.1087031-1-antoine.pichot@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Antoine,

I tested this series on a Microsoft Surface Pro 7+ (IPU6 Tiger Lake,
8086:9a19, sensor INT347E, SKU Surface_Pro_7+_1960).

Setup: all nine patches on top of linux-surface 7.3.4. Patches 1 to 4
applied as they are. For 5 to 9 the only change was the pad operation
signature, since v7.3 does not pass the client info argument yet. The
tree also has "platform/x86: int3472: map the ov7251 power enable GPIO
to "vdda"", without which the sensor does not probe on this machine,
and linux-surface's V4L2_CID_ANALOGUE_GAIN rename.

Results:

- The sensor probes and streams 640x480 Y10 at 30 fps on the 319.2 MHz
  link.
- Raw capture from the ISYS node, ten start/stop cycles of 15 to 20
  frames: every frame arrived, none was pinned at full scale, and the
  receiver logged no CSI-2 error in those runs. I had not run the old
  PLL setting on this machine, so I cannot compare patch 1 with the
  behaviour before it.
- With V4L2_CID_FLASH_STROBE_OE off, every frame sits at the black level
  (mean 16 to 17 of 1023). With it on, frames alternate between that and
  a lit frame (mean roughly 240 to 340 at the default exposure of 504
  and gain 16, with a face about half a metre away). The emitter is off
  whenever the sensor is not streaming.
- Patch 9: the rotation control reads 90, and the frames are upright
  after turning them 90 degrees counter-clockwise.

Face authentication with Howdy works on the lit frames.

Tested-by: Firas Sharary <firassharary3@gmail.com> # Surface Pro 7+

Thanks,
Firas
