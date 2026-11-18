Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992595;
	b=rYf0WvHaXUFGKWXEQEqf2kR+eZNC7ANQFWPHaaalY2AOr4QqMy8TzDd+AYyVovsTwVJ8
	 Tx7uJV1u272wW0G3Yn1KYQL9hWwbegw62Rvfrf6XE2+jh6NjrzdWTyDBGGtSkUcy8w4Mp
	 BjUaXlt/xaYsco5iS+dSAA93SrPNJ/HiGV3qcZSlWw0gAeBcu7GxliHuGC6AwhomqzCWo
	 VKPbKUSa4SHZaO10yL2kk6L3y89QlS3l4HV9COJQHWq6Y+GgRvrZGtfjjsW2WPa7FNWJ1
	 IQYUg6s25wGsPQzfuK8NNU/5+pj1u1GCPLl3hdyhfDQogoAJ5vVtDswjf6BcoUkYNuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=95twHbzeA00heL+oAogGUGCTEC8PNHef6y6dTCesOqY=;
	b=J0Ccv+oeIKrK4CmTZejlRYB4V3fbZ5RrUuA71xBO9HFgpEcdzVPpHxIgMC48KItk1QWM
	 FSS3RXjRA6oiUmd4zgFBTb+GlY7rh/BFDttIpPi6BtFwgf0KL1odk5Ig328Kq807SrcwT
	 0H2QWUBkqJrHMxEssZdXIABwh0C42d1FvJ1JDgxihOP+V9NlYIF9WGAuhFgPjnP3WyU++
	 ujgI8nl9oddvMF/xWBnKWKEwZueurjvJxEgV+Qv8+BV05cPJQgOfM7Reo+OQFcYdjixJh
	 O7jq49HClKbNlQpYsYy0AVkZkYVfz1LbDUdxevd5f33QEImTWdL6zT+QiWpA8idYNrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gIYhQdm5;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EB7606A32A
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03EB7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gIYhQdm5
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so6006185e9.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 01:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794992593; x=1795597393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=95twHbzeA00heL+oAogGUGCTEC8PNHef6y6dTCesOqY=;
        b=gIYhQdm5jlpUq/yxvwg5/4fv4Inn9b6ElHas6OrHW2dQ9nML9Aerc0CK6vYZNpPRAf
         IjIviFYpHS8cWqlztSNyURiNwp0MTqV7qb6aazxzroDhHe52ZGHWY/2zYjB4SmO/XZjm
         zRUNjuhdHZd+G8bIf0dAMEmdgibehAmmMtM3YUnG4Oc8soL/1S5p/Dpv+HKGU24xSXCT
         ocFYhOBp8J/V3E6ifQlrPNe7yYXV5rjUoeHZLJRukmdwqraE/StvTHQbCSL+S03FbRRs
         8wmcnH45a+hdI/Zsi50GgMCECpl1CJ0+yJVoSN7GFVg5JTJH/xgrEDksHcyNa3hvVqtB
         wD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992593; x=1795597393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=95twHbzeA00heL+oAogGUGCTEC8PNHef6y6dTCesOqY=;
        b=p9uVX7oBulx5AFK5ZKCs9Zrn8iOYiXbEK4Ra1u8agQKfMegFSMbWLSPntrTfG9kZFN
         p5QgO8NRlA5Z6fkZrYcwS8kFyJy8RElghje7G6hux29oJjJTxYTZNvoPqBRuPKyGcdgy
         iRJA9GtvqReTqSIucuiHr6Jh18DAD0CtJ06X//75sV+5cpvPSzTD/xkVYqBoUpcxe5+M
         EluexLu10Wu4CUwXjbxVyaQN2xoyDdaVnaLu4FUUeS9QCQSCjTk9LAUBUuxMhBQVLEuE
         f7OuFFjyd149rdRy2Y4jEDK5uDKMEDU525Yegn4REL0n2bKC2poGUaIIWWsSUdY/fCha
         CPkg==
X-Forwarded-Encrypted: i=1; AL+hErEURTf2QfkR82ILrAS/Zg58lH0KneCQkSHzE4aEsxumDxfPZrKZD/gpjFvbRbP2MZJXNLskQ7txIHAepA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9faNnAL4ML9WRNWaPoguhqPVRhUv/6fjRDpG/MER/KpYZ+xg6l
	TQupvkPvTmBjnujgQA9D6dQ1m3uxEfICRzXVwi9BnfIpaeHx2ynkfVeX
X-Gm-Gg: AYBFou0XcNdPMg5obNSDMSNnAmq3hP+qXvTksFbmU/gBnOZg453C7S7/fWtj4LpPx2G
	Dj3hSuY3ITTQIxfuShEhImVQoikdZVEjGie2C95N7V/WRKNkp8iPx0w6PPy1gCXjq1V9YUibmvp
	s4ppC/ZhPVITNV3/OFuoZzSqtythvDy44WtNh8P6paSuB5UK6x268h0z6KdcOkQwly4Mkeylalg
	BbDCzzUyC4GvcYltYpBt/FLiPKYlzgfU19xG7hTnRS8XdLdqXOCTBqu9Rub8RDNQbcsR4kJjMae
	MlsrbNPFnUnCOhYPcyGehke/z5wnzbx3HMBoeu95YHSD6DYfjhlAZ7d02oyAWQrq9ctL9fYCxdL
	MOSNgCbMkdskEMr5X4BSjiN7m4kZlTk8GOidurtu5KA/2LLNxn3lcoVmovkINKrK8U130vp8Hg/
	vxOeTK9EFlu7IQRorS7xEbWHuC6zQVYIZ6qv695Z4s8/xvsUTFh9XBl0cDTfW22uhQgO80OOUaO
	eNUiSmyrNzVJmfsvVCKyi5N24/6IkCWfCsAKmQ4Z6TLZwBctDKP5Vqh2Pxd3TBGuOkCrw9YvTqV
	0oZWIVS3ZabmJwDfG4zF95BjqWFP1MSFE5hV0MqcPhlM50LNHX9AtifFGCLbbt1Q4UeLSjoIkM1
	92aO1XWvd3PSgAUyk3kz/f52MaVagIPUlgInJ39uiDRtuN3RkZGUAGPXlqxzWvZpUU0Q7C3MR7D
	EuIG7+Jfuyh5iW
X-Received: by 2002:a05:600c:4fc5:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4bb7da3ad9fmr32336225e9.28.1794992592998;
        Wed, 18 Nov 2026 01:03:12 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b979bsm50596605e9.11.2026.11.18.01.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:03:12 -0800 (PST)
Date: Wed, 18 Nov 2026 12:03:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: DelaySystem@tubot.lat
Cc: slongerbeam@gmail.com, mchehab@kernel.org, linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
	imx@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: imx: ic-prpencvf: add FORMAT_TRY
 frame interval support
Message-ID: <av1pyqEEPqwG8gz5@stanley.mountain>
References: <20261117-batch1-m2-prpencvf-try-v2-1-dd331ab13137@tubot.lat>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117-batch1-m2-prpencvf-try-v2-1-dd331ab13137@tubot.lat>

On Tue, Nov 17, 2026 at 04:06:10PM -0800, Maximo Manriquez Lizarraga via B4 Relay wrote:
> From: Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>
> 
> Implement frame interval handling for V4L2_SUBDEV_FORMAT_TRY
> by storing and retrieving per-pad intervals from the subdev state,
> following the same pattern the driver already uses for TRY formats:
> ACTIVE intervals stay in priv->frame_interval while TRY intervals live
> in the subdev state.  Add a PRPENCVF-specific init_state callback to
> initialize TRY intervals from the active default, and move default
> interval initialization to prp_init(), which runs before any state can
> be initialized.
> 

AI is great at writing monkey see, monkey do commits but it sucks at
writing commit messages.

What difference does this make in terms of the users?

regards,
dan carpenter

