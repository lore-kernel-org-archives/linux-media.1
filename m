Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A672388386
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 14:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785164220; cv=pass; b=PhLrURDtPkrgXuYwTxAwn3M15f/pmBIT2ZMaOdWPpavP2kOlByOZUv4nGLLJV/oIioWDKjNoWSk/hUDPnt3UseurZLpImzJ2IsDMDg3wlMf7O18bvHK42/zGqPpy16G4vR14ffSxKWbc85bulYte7nopYmZX8tAt9W8iCSfspgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785164220; c=relaxed/simple;
	bh=TSwoKTe1l3CYsCvzzqA0JaWPQVc2pbDgVbQt6WGgt7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cnCjwNyPSUkQgw76A5HjxQ30lbNzKUxj+x+/5HacNSkqq4z8AuOmG3E5r7gvETwAPyhQ4xf6vgyvtWib0BFGFEjxZzunJd69pQ9+R6wVucUqHGdW50yWOavWfNnBO+dQOJ8MgzBOKtORI9SdEMHFpgUOlMC1n7XtE08QdBfmN6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZpeHRXw; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZpeHRXw"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso3867988a12.3
        for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 07:56:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785164216; cv=none;
        d=google.com; s=arc-20260327;
        b=ZmFuYFXj2JI9dBp4cR12Wa12KCEm1eHLdSEPVUVHogHhWjfJa8k8np5SX7JdbN3K5O
         NgjopiBfz7ViYgBggd7D1t0df2JWhAYlKDyyHrD7AtiSy8Vq2+WHt0pyWnbPwlN49X0z
         9ZbnITaTIGnUZXZBKbYWv3id/fG085SKpkpWG7pSLEq2GInAPsYUZ1i1ynsYT7zRWV1U
         zR6J00SPLQrqcPQn1DfBxsLQFALquLKGA1gUdk994FRmVdj6jbSHcFU+hCyGYs04o6Ze
         5pno09ZIt7tr38nCtSj+HAvaDKryKRni/c4WZbigwAH0RlmC+i21vpMoy+gsbwQ6/lgA
         /MWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TSwoKTe1l3CYsCvzzqA0JaWPQVc2pbDgVbQt6WGgt7A=;
        fh=hhccoTf9yPx/euZ/q77BABVEFI7GCRZPP6LMiSVK3iw=;
        b=mgEHwLdk9qudkaavL9biYDpxYVcwsprVgAPSZVkwrXQ+SHVO6j/LlvYCk7yyH+Ea50
         sPoBWROiWyU/MEJ9za9wglWFEDEqCJ88V6YTQD4HrWy27Szsl2e7m/BRmWZekfyyQGQH
         otRnGW9Un5wwd5eW/5isjumTs/WTbVZ9GmjOtUmginA2nPoWEbydr76suI0R7LY7BrAb
         i1ujdmhUDtwD+C1w3sGzkfIYMAyGoX27zQa4eqPbNzOEZcNtR9hRlz8pTmYijJs1hRQX
         0gJw3p5cyYaCRkKX4m+nduAprA8IPjn27zw5TR6YUi2ZZWuq1059J7Oz+yMFCLL67PCm
         oCHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785164216; x=1785769016; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TSwoKTe1l3CYsCvzzqA0JaWPQVc2pbDgVbQt6WGgt7A=;
        b=MZpeHRXw0bLGbfqT4R7/JG6j2sCpMyGXiY0qVbinsvvKqNcwrCmTxuYX9+G419cT/I
         QwVVPL/j2TpmT64B74ikmNsbHNXGLDBuJ3SBGjrnpfnTPmIOXBaedK350xDiL4w6Hj+b
         dHS0X46de//h7FSv17qk0MTn1p4E4oTDXLADrak4N29ug9u721XxzW+C4WnTObCZOnlt
         sRKsOw83mut3QQe06mPCXnLRInY1gjrY82F7gUPBzF0kPRGAW7Y52xwnwLbcBA+PbjH4
         TUuPeLxmeXf7SLCV18DtrwCJA2u+NW6pqEgciPBcDzMFDJIVp74t0S6nkCKz/crQruts
         BdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785164216; x=1785769016;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TSwoKTe1l3CYsCvzzqA0JaWPQVc2pbDgVbQt6WGgt7A=;
        b=B7rLHzTG/fNAsOcqe/HJm/mAmXMczss4kBEAscMq4qqcWfiSdujdWXCYuKL1XfIPSk
         H0ALrCLEUuDQtj92BBlmcYZosR7NaEbdm1sw3GkDSzhKDcsksqFeD0Nz/COA9pd7x1Bw
         rwfqjR3JX41Bjjm5arWV/02vVqSBpIP4C85yzyExM3aQWm2eF55LeouRwZ14oCBeu2wH
         OIYPEH3WJF8qM0+uZNzLvio9WsNbntUwn0eHDLxON9R5Tbker5KzA+dV079DBXvUMMxv
         SIHClWHD0bjQAd9sjK04FXMqrIDYfq4zdHUv6ebAacUheyxLwN6RkVxuk+IMaPkvIx1Z
         R5aA==
X-Gm-Message-State: AOJu0YzHxbiUWWPQydfHtqzKltbGBj/NcJgDKuUb/Y8HW+FKHtPgEelT
	G6dWSdqNbhKe27aBtAcCImT+m5z6Th6Li2bFU6OHotC90sT+4v2bVYVdqG6usqlE5xhzvFLtL9z
	Jvur+/DfjE4Bq0Up7j3gfdSrJF1QfWt4=
X-Gm-Gg: AR+sD13nABQkYaFRWSvVxCuqvqE8MUZrM1R3qX78VtAfpO4Sz22F4vh1fRA9kFB8Q3g
	jb1DR7wGpRa2coI0AEN9W8QupEfNd0KZKLg0lbjy4DQnfBgbfTDhx/zrqdpnaO7m9NHKCLpXRe+
	6DtIf8QLTY7GWElvChFmEPcNkKFGrEeuoaEbL3YinRt2dml36U+SU+HhUkuHlyDEm9TUFVzq5du
	CSKHnQwY+5wMZt5FCGQkQcCNQOqU31SmERyrAhZtVanKN7Odr5wQ3s2ekifxrAfWQTbjdjisHt/
	t8MF9BO0DzuQU4K80jC4gMrAF1s97UJ5KJr0eKFaaJdmIvg77hPE
X-Received: by 2002:a05:6402:13c7:b0:698:5f89:9a51 with SMTP id
 4fb4d7f45d1cf-69fc1005352mr3887420a12.5.1785164216274; Mon, 27 Jul 2026
 07:56:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709-hm1092-driver-v5-0-a1f5baa6fe08@gmail.com> <20260727131252.1580332-1-j@metarealtyinc.ca>
In-Reply-To: <20260727131252.1580332-1-j@metarealtyinc.ca>
From: Ramshouriesh R <rshouriesh@gmail.com>
Date: Mon, 27 Jul 2026 20:26:44 +0530
X-Gm-Features: AUfX_mwubI9gE4liERuXHBaxiFJiyy5riHKW_799DoBOuDt8YQgLhKfQWk0HDhQ
Message-ID: <CAJTcUFQxyVWJ7s3WnZHV+wob3nnkXH2_iFJL8ixh_Y8j33ah6A@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] media: Add Himax HM1092 mono NIR sensor driver
To: Jake Steinman <j@metarealtyinc.ca>
Cc: linux-media@vger.kernel.org, elgin.perumbilly@siliconsignals.io, 
	sakari.ailus@linux.intel.com, mchehab@kernel.org, hansg@kernel.org, 
	bingbu.cao@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jake,

Honestly, thank you for this. I'd much rather end up with one good driver than
have the two of us shipping HM1092 support in parallel. I went through all three
of your points against my own numbers and you're right on every one of them.

On the link frequency: yeah, it doesn't add up, and I don't even need your board
to see it. My own registers contradict it. 1616 x 750 x 10 / 2 is 181.8 MHz at
30 fps and 363.6 at 60, and 400 MHz is neither. The pixel_rate I derive from it
works out to about 66 fps, which isn't a mode this part even has. So it's just
wrong.

The one thing I don't want to do is blindly paste your number in, because my
EXTCLK is 24 MHz, not 19.2, so your 19.2 x 94 / 5 = 360.96 doesn't land on my
board the same way. What I'll do instead is actually pin down the link rate here
(measured fps against hts x vts, plus the PLL dividers for a 24 MHz input) and
put whatever falls out of that in the cover letter (or commit message), with the
working shown. My guess is it ends up a lot closer to your 180.48 than to 400,
but I'd rather measure it than assert it. You already ate the three months on
this one, so I can at least not guess.

And you nailed why it streams fine for me anyway. My CSIPHY gets its config from
the PHY driver and DT, not from this control, so a bad LINK_FREQ is completely
invisible on my setup and totally fatal on a receiver that actually reads it.
That's exactly the kind of thing that shouldn't reach the tree, so I'm glad you
flagged it.

On exposure and gain: fair hit, I'll fix the cover. Saying the map is "unknown"
is just wrong now that you've posted it, and it lines up with what I already
have anyway. I write 0x0202/0x0203 and 0x0104 in my init table (0x0203 is 0xbe
for me vs your 0xb4, same register, different default), which matches your
exposure and group-hold registers. I'd really like that patch on top of my
series. Like you said they need testing against my 560x360 mode first, so let's
just do it in the open: send them over, I'll run them here and tell you straight
whether they work. A driver that can't do AE/AGC can't do the actual job this
sensor exists for, so that gap matters a lot more to me than any of the cosmetic
stuff.

Geometry: you're right, and I can see where I went wrong. Those get_selectio
numbers came off the binned readout-window registers, so I was describing the
crop window, not the pixel array. Reporting a native size (1198x726) that's
narrower than both the 1280x720 active array and the 1296x736 mode in the
Windows tables makes no sense, exactly like you said. I'll redo them against
real array geometry so the selection targets actually describe the sensor
instead of my one crop.

On the bigger picture, your offer is clearly the better outcome, so I'll tak
it. Keep your ipu-bridge HIMX1092 patch, it's orthogonal and I've got nothing
like it, and I'll fold the three fixes in. Getting this onto two x86/IPU7 bo
with the sensor wired differently on each is worth a lot for a series
that's only
been proven on one ARM DT board so far, and I'd be glad to carry a Tested-by
each once it runs there. And if it doesn't run, tell me, that's just as useful.

On provenance, since you were upfront about yours: mine came out of
com.qti.sensormodule.hm1092.bin, the Qualcomm sensor-module blob in the ASUS
Windows camera stack (QualcommBSP/qccamauxsensor_extension8380),
regSetting block
at offset 0x9e8f. That's a different vendor artifact from your hm1092.sys, s
between the two of us the table's now been pulled from two independent Windows
sources and they agree, which is about as good as this kind of thing gets. A
maintainer taking either should know where it came from.

So from my end: I'll respin with the link-freq derivation, fixed geometry, and
the cover corrected on exposure/gain, then sort out the gain/exposure patch
getting it onto your boards with you. If you'd sooner send your findings as
standalone patches instead, that's fine too. I just think folding them in is
cleaner.

Anyway, thanks for doing this out in the open instead of just landing
a competing
driver. Better result for the part, and for whoever has to debug it next.

Cheers,
Ramshouriesh
