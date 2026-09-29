Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F1E33BBC0
	for <linux-media@vger.kernel.org>; Tue, 29 Sep 2026 05:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790660813; cv=none; b=SPKixs7HHo1MAnEyoig4s2stPljbZ1xIE7opJ+ExMLZnwMurlILRn4K1hdHGhFeKF186YD7wER940bIWxnSNuQgIdIT4JgY0bluwamakqDoZ7IOLr7wZGsJ1jeTe6u2CkbWF9Nz3r+ANUr0wV7p/c9BrBbtlHkaC9HvRQOYlG24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790660813; c=relaxed/simple;
	bh=19RKWm2TvHXQjaVd9wrtTt2aCydxEIrRty/M6oCetH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zld3C+k4PcXrBur8zFEbzCYBiGwS90bfKXH364hOKwG9XkKOWk8/fLfVOCoU1QR3iArzaQjv65ws4ZNw5pS6XYnwyc17RmWQ2WeRfccsHQXjG4GbYj+am9sq/IPZtPNe6E0MbRkQ7dBYsCBPlGpUq69CASXcoA5FYvtCG9yxrnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaB0vfBl; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaB0vfBl"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so2653125e9.0
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 22:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790660810; x=1791265610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cHaIQHQAzypExf5bg6wFndJXSrqRhD8ZT8crEHQrTnE=;
        b=BaB0vfBlo/7PaJW4l4T41udt6iHK1H552o96nEoTgIh8SzAxDXdoJpqphPJOUCffn3
         mP9ijqzRJM2NTF2FDuCXVRSBiA97h3buDmV010MYrZ74sAw70DFqVnntdZ5clLDWXf5b
         3D/45FzZn6SLivYPCwiHkEVJx1eC3261s1VSenK92IB5yXMd+VyvG1VAXFB/wMD54HiQ
         G3t1ucEPlNlo7uGuhE1+CJfwD5u9coG9D/UK2HUJ63Rny1uSEtkML19t+1/3muQd6Xi7
         AtyAGQt0eObS8A/6op4DZxSEQv4vTQOMrNX8qpF0aAEOTjk9dgShPqA8CgqBGy/cEhV7
         M73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790660810; x=1791265610;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHaIQHQAzypExf5bg6wFndJXSrqRhD8ZT8crEHQrTnE=;
        b=q1bwYsCkpAdQb4xVtsI4oCCm4XPaGzt1afYmnQRQw45aj2Vx0ARihiVveAF7/zVbLv
         2djrcd8eAttdHRZokmEcFnOsuNPdQ3QN58uTCFsoJmJ6O4bnKQzkrlhXCnGCLctjqg+P
         kZ5G+00Ro5mUMEmafaBW92gj9+ft9vwhsSO0L9qtvfyz6dZQAIHsVVBnFJBVbMU2TULj
         PcLkcOKUdVxhZg0XGw2fyw8ZhxVUENUWbgZyHgi+/noh0S5edyKw0y+HpOAoInaY4jb4
         TbILTzk2WYfGvoCoUJc5kUPiX4vOyiyPGo1jvTKju92Mdq6O3of7TRzfvOVf37llZBuS
         g6NQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXKzt8XXGA8fOHuywo6Ij3fpcYZfML3tamRlVxb+UjqUB4dlWPsl4kCOd/MtU5X2UDfzLbvFDIsz1u0A==@vger.kernel.org
X-Gm-Message-State: AFuF++mw5K1VY0mHxS6VwWPeRXrEotE7m6WKq7aZxUt0QkWoHe4yYHip
	mNV04F87/e4Q+vFevotVZaCTmWU/wl6fP7hgNfUxBQ4QREMFzuFw7AC6
X-Gm-Gg: AYBFou2tojoT0HkvCu9kPgBQZdaO8GeZ93mn8C8RAkddwEbgIght2nEtjTwPqv1wLbu
	X9xtXc0K8IVUmK1gw+SJHmTQO8jEd6v+W7DbbsHnTbM/JSlqe6m3a1dtYX+gnyB8levdKRZ0BVi
	+or9DI3T5ayJ8mBfTVqYyH6/t8DnutXbJf1wRjHBx/zkni03QPAWWbpLVstRF93GSFxbIO300Ct
	/0K5ofdxw1K9AdCB4eqjx0qA5NgQgTweP1gqaMCwvbsQA4V53yEZ32s+HohSum6Y/FOyXGXVH11
	jAHJqcEpRL7Qhi9CqE8h3aRojR8Ay+U+JJzGRoKf2amw5DnvIFFiDcR5TTciGsx43g7cuzr+IDb
	6H/yqB3RANYOopJU5GVvpZofmcoYvYQTN8SeP2QeybZclRCJRKbgWKkz+hK3W4hAOlIhx0BbW2u
	9fQcV7UcR3Qobc282JVwFDJwnao2YE6yRmTwDNGW8dSTCF4n/raLUA6AhIHwHHUj832pY=
X-Received: by 2002:a05:600c:1550:b0:49f:fefc:7d01 with SMTP id 5b1f17b1804b1-4a00d778f09mr19426275e9.15.1790660810212;
        Mon, 28 Sep 2026 22:46:50 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d45ce1csm32021415e9.3.2026.09.28.22.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 22:46:49 -0700 (PDT)
Date: Tue, 29 Sep 2026 08:46:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: Michael Freidkin <freidkin@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: meson: vdec: size capture planes from the aligned
 canvas
Message-ID: <artQxRR3kJUv-mBF@stanley.mountain>
References: <20260928165045.642354-1-freidkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928165045.642354-1-freidkin@gmail.com>

On Mon, Sep 28, 2026 at 07:50:45PM +0300, Michael Freidkin wrote:
> The decoder writes a whole canvas of ALIGN(width, 32) x ALIGN(height, 32)
> (amvdec_set_canvases()) and reports bytesperline = ALIGN(width, 32), but
> get_output_size() derives sizeimage from the raw width x height.
> 
> When the width is not a multiple of 32 the planes are too small for the
> advertised stride: for 720x360 NV12M the luma plane is 262144 bytes while
> 736 * 360 = 264960 are needed (282624 for the canvas the firmware fills).
> The decoder writes past the buffer, and importing the capture dma-buf
> into DRM fails: drmModeAddFB2() returns -EINVAL, so e.g. Kodi plays the
> sound over a black screen. 1280x720 and 1920x1080 are not affected.
> 
> Size the planes from the aligned canvas the hardware actually uses.
> 
> Tested on an S905X (GXL p212) board with LibreELEC 12 (6.16.0-rc3):
> 720x360 and 1920x1080 H.264 play through V4L2 m2m + DRM PRIME with no
> AddFB2 errors.
> 
> Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> Signed-off-by: Michael Freidkin <freidkin@gmail.com>

Reviewed-by: Dan Carpenter <error27@gmail.com>

It would probably be more reliable to just ALIGN() the width and
height at the start so we don't have to do it over and over again.

regards,
dan carpenter

