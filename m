Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126740;
	b=Bg9b4vVlhOUqwOUCu80rfEOL4Ih/c7FXSVWYBwQrTfgL1m93xEGg7FHzKdzy1ZbTKvqR
	 XxmkKbLbM/T1kf9JYU8a7dc29H+h2sF7XfT3PwhbO8VnALwCSdgQN9FNnmro17zHiWpPz
	 HwyfqOK22jjjelqRlaTKTFXC6wcmWaa4B//S9KjKfrYQ6Is5iGTG5eSg7phEm0fBU3PD2
	 0EroRfv/ZxtxAiRDcBzYXNqRlPC25LJDDjHoMWHsb/CQdmYRPV9HMQOgzvgoMzQXAcrBU
	 MXx8wv+b/kiUdIIdnQKJjLhziMrSXjKNZKRz/Y0pj1zJxxSX2EUivzHI2pqwvi9/HyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126740;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:From:
	 To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=XYx5fIHYinG6+ASlKKCycyZ+xAux0HBR/8E9lJGdg3g=;
	b=3PdjNatVGXwFdcFcpcTXamoyGsAsM+CU2vEOg3iRY6AzTmbSelbPzw8UEuP6qKqZBxMr
	 +wkn5Vw28JGGdZjC3JF3RrZAi2naQWkOrgyoWFS5WAVmWa+k+S5+n+4ufj6NhUpb+Q8dz
	 X22CemQo5d4FgsRGCoThZmp08WZnk2HG4zRh9Xa5oTZRYRH27VnQpRFaOi7inU4EZtAUC
	 j2mgV7QyN9q5k+/BU8O5L6yco60K5MNcxGRvNCIAf1nm6EXYndfi6Jvej60fVHOsuT+fx
	 llHg8C3dvPfmI1kXpE200j52v0A+3hXoJZyK+jwE4Ktbw5CBZdIXuseAyNeBNDIlhDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E979A606A31A
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 18:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E979A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a210470b49so1377165e9.2
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 11:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126738; x=1793731538;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XYx5fIHYinG6+ASlKKCycyZ+xAux0HBR/8E9lJGdg3g=;
        b=cBimXvSKQCDlBu5sDTloD5UoMRsFhktnItQXfM/fazl56ZTKhmzOW7ObqG1Lx5h+E9
         scbsAvZBTB6XpEixyfAkIMx8SjSLoAAHOQeU9XJmFB+msSlhSi2Uqx0Ag195QG0rLuoJ
         SN2NBxjk2NIJOnDPU1/vbnmWAHJ/smU742QBjRHQovK6hdjzCNKy3YDuFtDtnG3wrSx7
         +7mvPwWV50yCqpnzco1AbwXfVf9GagVoQlmaSyg+ZkN2JaNcZlPZCEHTgbjIRnGxl3K7
         i1d1eaoTQxR9Lk+hL9/pa1rUjMx9CuKCXtEWPAjQCUTJwXUWlVDwsL+l2b9rn5QIW9QI
         yn3g==
X-Forwarded-Encrypted: i=1; AKwUvBy03k8oGIA65/5UVzy48y3N7oxtaJPaeBjqDTwYhQe8znuH+57WbuXO/Dn9GuLQ0pO+mEsdH2ODK5DHlQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK48uuvlVIhLXAH1TrHI653rK2hjnr0gdIAXSXxZEIMZh8WNo56
	ULyMCEHPvi4yvAtcJQwoglj9Se9J5HjmmNqDRzvn4IdHG7T4E4/haVq2b7SyTSofew==
X-Gm-Gg: AYBFou1fPZMt4S900y6IeDyoQ+cKSbBHRSse34nZSPWHnORRT0b9VrOyMNEr0MKtFMo
	roKfDnZ/zBjOxCJTq+N0xqCgibP5/FvUbhdLmpMpzWNMuibkDX+bzqtDLBrBDF88+ALw1CBp50Z
	l6RqUfPCvH4LFcRC5k53/AJ0useRd2dOvGobXD6YsI4LMJfb/Jlx3CBWWvG8p5X8NEPxVqBdzMn
	vcmJRQ0Bt0mxzXbM8cah8fCrp4dp7a27wW8IUeZIb9axAeGM1sZo+b8fO56Egd5c0yGjgpcn8zy
	xKepJmba88x6kRUYcPP4F/BjwKmAZcj52LWXJupjGv557yEDqS1wQAxXxghAZdLDlGwL5wrNMOT
	9pqY5FxSpmiMuOZmAXhjkewadGYJDL09ngNq5rt6Zz+bV52/6BtCbU+zqyBMhOr0fV6shJh8lz+
	kq+L7rTgUv3wuxlroJbFXSDAt8cqW7dTs/pe6nWXpJD7+IsHENFb1YoCigv7mRx0Rv9TA280+bZ
	reDj7gT1FWOu4h410olQa5yVK6AFbqmDxMoJvcU2acu5H3Jgqu6CDqL2f/rmwzhynk3gGtiNFsw
	48V9NzE18+lgHe5bov5/1qFLyt9AI74n1d4WUb+DDMVfSCKkiq+rsQQV36Uzrw==
X-Received: by 2002:a05:600c:4e4d:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4a35acba70dmr224003675e9.24.1793126738001;
        Tue, 27 Oct 2026 11:45:38 -0700 (PDT)
Received: from [127.0.1.1] (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94e1dcd1asm923765e9.7.2026.10.27.11.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:45:37 -0700 (PDT)
Message-ID: <6ae0f151.0f9a9df6.1cace3.5239@mx.google.com>
Date: Tue, 27 Oct 2026 11:45:37 -0700 (PDT)
From: D. Manresa <dmanresa@gmail.com>
To: antoine.pichot@gmail.com, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org,
 dan.scally@ideasonboard.com, hansg@kernel.org,
 andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] media: i2c: ov7251: fixes and infrared strobe for
 Surface Book 2
In-Reply-To: <20261027132641.540323-1-antoine.pichot@gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
 <6ae07c62.e52dcaf0.293af3.e647@mx.google.com>
 <20261027132641.540323-1-antoine.pichot@gmail.com>
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

Hi,

On Tue, Oct 27, 2026 at 10:26:41PM +0900, Antoine Pichot wrote:
> On the Book 2 the firmware reports 0 but the picture comes out turned by
> 90 degrees, which 7/7 corrects for that model. Could you please check
> whether the frames are upright on the Pro 7+ and, if not, tell me which
> way they turn?

They are not upright here either, and they turn the same amount: the
Pro 7+ delivers the scene rotated 90 degrees clockwise. To display it
upright you rotate the frame 90 degrees counter-clockwise, that is
270 degrees clockwise.

Two independent cues, because I did not want to rely on how I held a
test object:

- the ceiling lamp of the room. In a frame from the colour front camera,
  which is upright, it is at the top centre. In the IR frame taken at the
  same moment it is at the right edge, vertically centred. A ceiling lamp
  is up by definition, so "up" leaves at the right-hand edge;
- an open hand held in front of the camera with the fingers pointing at
  the ceiling. The fingers come out pointing at the right-hand edge of
  the IR frame and the thumb towards the bottom.

Both say the same: up maps to right, which is a 90 degree clockwise
rotation of the scene.

Conditions, so you can tell whether it is comparable with the Book 2:

- measured on the capture node fed straight from the IPU6 ISYS, Y10
  640x480, with the userspace bridge only shifting the 10-bit samples
  down to 8 bits. It does not transpose, flip or rotate anything, and I
  checked that before trusting the frames;
- HORIZONTAL_FLIP and VERTICAL_FLIP both read 0 on the sensor;
- this particular capture ran on the out-of-tree Surface driver, which is
  what is installed here, not on your series. When I had your 4/7
  applied, camera_orientation read Front and camera_sensor_rotation read
  0, so this machine has the same disagreement between firmware and
  reality that you describe: _PLD says 0, the picture says 90.

If the Book 2 also comes out "up at the right edge", then the Pro 7+ can
carry 7/7 as well and I will test it here. If it turns the other way, the
two SKUs need different values and mine is the clockwise one. Either way
the DMI match for this machine is

  sys_vendor        Microsoft Corporation
  product_name      Surface Pro 7+

with the DMI product SKU reading Surface_Pro_7+_1960, against the
Surface_Book_1832 in your 7/7.

D. Manresa

(Written with AI assistance, directed and reviewed by me.)
