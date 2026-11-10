Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794338625;
	b=D+Ur2HEbfLfM7c6u5rTdQrHooDWlIHeEsfs607iqlee+SaqY3K09CWiaTEUN8EbaIS1N
	 /xxxkCo2QCJ1HlClxCyFot3evu+NmsaP+F1byo0qR6gLPe/s56Ae/umU8K4jEUqcMB2G/
	 sVci6ovMozwjw3LMRBkYpODJ2FxtPeCpIeCbRYfEcDEV/2kD/f6Qx2BrZjUovniqW+DBo
	 r1yIttJjyX03VezJYlDRpl4n0JrL/IvyD8s00Q9hJhifJ9dwT4Eobdg64G6UxvIFs3BnH
	 3/ysBYb9M/MwzZe8Udu1HWxzxHjNcjyTnEoBjj7F6ZLYDdtq6W2p/DeKKpXbCP2JWJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794338625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VhSwB8C2Atai4f63OWY2MkRGEM/VR9CghwTRTwW7K+s=;
	b=dA2kWf4et+3/un31VEoJ5G4KAcDudmynkw+ACYkm9vKpPowCQ38nwrJip8K37Zmc/G5b
	 I0n0y6ua7rNHABJTjEXo9OpgLTvuWdrBH7TfZr2rz7jHfWUYoYYQ42UcN4HFX0RXHyf2a
	 MbysijsYGQAjxlpZv9GNaTl6KOsd67VPSENCAuzh4lNb+jHtxLlnwECAcGXAT/FkaUw66
	 htvRTzcQjWhR2v+sypYOXdyzmRjMYdMqaYS/MXY0J5I7JJtUOjObrzgqBweXi09zCVEsi
	 bxeJ3kqipdyDL36G97Fly8q2OMPxZBd60c69Zo7lXasOBe3L78AqrQu3dqbf/jUVhZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=metarealtyinc.ca;
	spf=pass smtp.mailfrom=metarealtyinc.ca;
	dkim=pass header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=fLEPEzDY;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC102606A31C
	for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 19:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC102606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=fLEPEzDY
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7d2dc9a7b52so1328552137.3
        for <linux-media@vger.kernel.org>; Tue, 10 Nov 2026 11:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc.ca; s=google; t=1794338624; x=1794943424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VhSwB8C2Atai4f63OWY2MkRGEM/VR9CghwTRTwW7K+s=;
        b=fLEPEzDYbIYtk1YbU6ZmQpN6irlYIbBy0+uzUm1tcfWI8thnbfx8ctYWTRONw5iGRx
         gVXevkQWwdbO4mlY6VdPaAcs+HVyvM6rYEke+zrR2L8ush8he8JnmAEi54U7DYZH2SiJ
         B1iAmBwLBsrh8rPez3XkG3JHR+opkleBp7yBHkh3lBocaod9L4mAliH5xqyuniESCdL2
         b6dJB38qeeN6byO1kfjjVy2BGQmfvrreIeRjuxVfhbqlRX60+QC3YuJUw9xVDkjvbMKZ
         r5+v4CdYoC074M1C5bokgLsqlXv3cq1dFcyfr0yD+HEdRVg2A1+HDodmXmqgiuRdZYiO
         4F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794338624; x=1794943424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VhSwB8C2Atai4f63OWY2MkRGEM/VR9CghwTRTwW7K+s=;
        b=DrgT+csuQTep0bdp9vtStr6v0X8RKdj5OUvs7u2NBtq/tTcA15mHCFk+c9YFADNoOq
         f+Em21+FO2m2Tcc2i4AEeeFfyi3JPGFvn0zfLZqvjph2283Fpcd43EPMlzpmvSzgRFP6
         V6s7sq7NXzAlRIOo/edE/AZutMy+x0vFddJHuxp7Tb37ovdxYNwCU/vQePJAu86awszK
         6JDkSLsuWpSRcksmxMJ5OMu9o57iaaa++CLkPPj5tRmGCUJ+6d5kX9B3RcS6Ax4I1DvZ
         qeirm79O7kMwh728n8pT5GidOJ5Nrms0VbHmzGrPZv/S+fURuXj48UiisggIJlliZbcU
         bGhQ==
X-Forwarded-Encrypted: i=1; AL+hErGRcQpHEHmonp6MjTcOHDpwTrhAn7Z3uLTwWVXwc+9hPKvBqXux0hXHGAp9f74IJwFbfSgJJ+BNjOAn6g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9i9v5PMxXS7SeIWRt1qHtZDlUWzqkno35yVznrBFL6AII9kpN4
	kIcg8wU5mSgonE1r4DSbiDaDjiS0438zjCKhhWiipz/nuCrCOdaT8qjdNQUtABzzwzc=
X-Gm-Gg: AYBFou31UM84hRaWNp3S4xw4/eZpuAOPdaDVMuQgplykIn6GohdhphQlAh8g8EBPazj
	WxiXN4/f/hJShQ1nFM2Z9LxQzBodoqi++FzmnNXEJa0Dagoj+5DsMlc7Og9lbqUuSnOPmc2N+9w
	rd2j/ZVVRDGHSxIXFwYbaxcgMa9JiJ0WfNYlXFzvvGCUZsDBJvVW2GEGXHBLD1cU+wDcHZ8dCc6
	P3dKZKKJYQwsmQX4gHMxsUZmZvh0xbYWrxozumm7N5jA0hP2UjG4eBYEyUUNBfBeAElE9il8DDV
	zhGmVIsnTyaGH7fea8LvQ3RdckEG429mPe8rKrdkAdu2MpWmQ3w79O8twXj+CaAsOdgJoV7zWsg
	np1TrKGDrXC54sj+dnj4hrlHSTJAGlUpkYJb3uPRnzf2iZOpog6LaaPaSQ5+AArvqkA3PDhPdV4
	3rTwQ6mFb56uVx0t3Yltf5tvG5nFDH18QOmblc0qkO21//DAFde03NNJIX+xW/VG2NgYiiL7wye
	gfvjWijkdm8blcS6l6Asu3C1OQbjGDPweCn8h3KWSR5E7KP8SB8ykjGc7XmQkzoarfdF1MRjwNz
	z/is0cgl9A2aUJoNXDv7uuA+vA0ZjAdBBq5XY093UWhs3b5n4/L/2lTK5L3lyikvfWmHPUIErpt
	+srQNt/XLSEYVIQxVu7vN1OjeCyVtedde8DKZBPOHF1dQh/D/KNOKiv8xAYxndcM6xg9Fzn2Uek
	tXs0JP8eOqPbuFRouPO/18BXJyatgD04i8QRXEAFr4ZSXXg4PlRv8IyHiKZ8rBHazU
X-Received: by 2002:a05:6102:510f:b0:7cc:80ba:5e5c with SMTP id ada2fe7eead31-7d301b91214mr1618345137.6.1794338623819;
        Tue, 10 Nov 2026 11:23:43 -0800 (PST)
Received: from jake-laptop ([2607:fea8:c6:a700::879a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d3023aed1csm2368632137.10.2026.11.10.11.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:23:43 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: sakari.ailus@linux.intel.com
Cc: bingbu.cao@intel.com,
	antti.laakso@linux.intel.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ipu6: Don't stop or close a stream that failed to start
Date: Tue, 10 Nov 2026 14:23:41 -0500
Message-ID: <20261110192341.1305587-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <avLwlhbOg-9EJo7g@kekkonen.localdomain>
References: <20261106121905.42571-1-j@metarealtyinc.ca> <avLwlhbOg-9EJo7g@kekkonen.localdomain>
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

Hi Sakari,

On Tue, Nov 10, 2026 at 12:23:18PM +0200, Sakari Ailus wrote:
> Please be careful with git send-email arguments in the future.

Sorry, that was a quoting mistake in my Cc list. It's fixed for future
sends.

> I wonder if any firmware communication failure, a timeout or other error
> should trigger the IPU reset (once the users are gone). The functions
> communicating with the firmware should also probably check that condition.
> I just sent a PR on IPU reset changes, they probably don't address this
> problem though.

Agreed. This patch also applies cleanly on top of your ipu6 branch. With
"media: ipu6: Return errors from stream stop and close" there, a failed
start already marks need_reset in ipu6_isys_start_stream_firmware(), and
this patch only skips the stop and close calls that can't succeed.

One thing I've seen on Panther Lake: the PSYS is a child of the ISYS, and
as far as I can tell the ISYS isn't runtime suspended while the PSYS is in
use. So need_reset can stay set until the last PSYS user goes away, which
in practice means restarting PipeWire.

"media: ipu6: Don't mark need_reset based on returned buffers" covers the
IPU7 case from my need_reset RFC, so please drop that one. I'll test your
ipu6 branch on Panther Lake and report back.

Jake
