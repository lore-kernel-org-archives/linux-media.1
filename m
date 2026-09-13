Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6173F1ADA
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 14:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310508; cv=none; b=O9fBU3+TnyycaEy6v2qhF+aNA/e7QhQHoU4FyOPkYXiXZqdDkorM5nu9wxFenlLSYBW+wg2NaaH1k7oFC69B4CCe3SIqbGtARyEfIeRgjoA1qVirYz9r736karPoH0Lld/wGXsLMj1KDNlhW7BRSrcrNrX6QXn/x8uHCaG3T9os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310508; c=relaxed/simple;
	bh=D7Ff3lh65lV03e7Igj6UyxY3UQtZS3FSzOTzHrYdvAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UPXFXiEJww8tf3UXk4uCHQc5QVhDofjLOEPUB96ag0hKqScntZ2RaHtLCBhF9pc24Oi0X/7ldtkZP6fOUWIpTi40H6D0wOJAw7Lovf3uM902iWJTDF8BK8wEIzYHJOIbvdLKNwM736o4u/g6YXDDa8pbNXDB4aU/flexoLebNPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5+rrMw0; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5+rrMw0"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so7871565e9.2
        for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 07:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789310505; x=1789915305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wIV0NAC3V43neVsR53ty/YkUZ7OARFktw9BGDvdOJWg=;
        b=h5+rrMw0K0wd0CqZITgtY1RxEl6oBK1Yjjc97ayBjVzBGh/04rwGQ88ikm4pui3qBf
         O2p+EAcmZQNh53rr+h99lE4LTWJjXXO/xx05FMujbL2IZRmY3wyG/sc91OvNZJ20gXxy
         8mEYm32PPVkqfVPNUxN5GDZN1Po+nOL/u91X8kQC7l/E9uBFmM1MnDtqTVWNf9SioRuH
         EhWiWNU/7ORKv6Mv1YrBv2rdcmP6ONNheB/q/7yD67ai7y3OJqQq6I8aPhx4vj/wHx/8
         y2m4MD6d9lvlvVQib1k79+qmhNvS1i2M0zwprYHdSAlWpfuah7E6eLqxt7UO+n8M4pdR
         d55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789310505; x=1789915305;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIV0NAC3V43neVsR53ty/YkUZ7OARFktw9BGDvdOJWg=;
        b=hfK8YJHGIMNN2XvAgJwXwDbExWm0VO3n9J8tkTCLtm9qbxFHUeGlsKwnWod60FfkRg
         aG/9F/tGVszwAV4nk2CE25hJs2pj8+9hCaNLR203TQWpPBtC7Euj2+XOpYBRB9Levm8V
         V6xNP3ZP86uh6cDS1krnTAoNtJ7AzK8bej0UpaLEXvmbmG65nuSRHU0jYZ358xQVuWjh
         N+7EW/ztORs2ErucwF9QW43nOSd7P7c4YLzHoyYbHPcCxiwaDOZgu3xNv7a+KSNbc8Ne
         OfPCsWoe8bzr1IxiGrj5MakcoonLiz1FfvgTv7rA5tQRQQ/9r/w8nqTenx9J4YNYiW1b
         E16w==
X-Forwarded-Encrypted: i=1; AKwUvBzKdqg3I22AcTc6IrhtowhJHfNyvt387hAkkBsiinHV28fKNTfhjpc7fmr0M+9GxZRS0Fi7AgnLiGlUlw==@vger.kernel.org
X-Gm-Message-State: AFuF++mu9JjfvrrZfSNe7q6hfMWaV5dOrVK0IcamWyg4qPunDdrADj+S
	Ktq/ISzoyMMh0gPOUEuXApMTsCNpcldrzeV5GSPAGUKZw8sC3RINBBvz
X-Gm-Gg: AYBFou1dRXyNbW3sAVBLIhSSFuWKH52NAl4HSa8PN6rBdBWcXhHUhwkjrvb8CjXM7CP
	PXsNaTf1xMlA8xnoC1BSqXcTXUJ/jaT0Un+gSnM5tyROUy/RmOYpK+dnPcJCMxC32/6bqeBcra8
	V0EhL6KIimE6y9b3hG3ny2TCx5YRzJNJs+1JK25c119Uxs2UptN5p0oHG/JIJt/PiKYofmSZ3FZ
	1GGD4QkZMSFHhRtql+sGfocNzKisQy0V2l7jFuwMlkqgjPmw1boJxMngnF82aO4c2gIW3fpeS+v
	sB7tczw1K0wmh79zDUqo20UHDeZIz2oe8J8JvlzbaaH4V3Mm+x5VcjT27D3C09yodS5sKhZyp2d
	3DsN6yMRKOmrguPDzs6bsfGitCF5BysqN92tNIXJtRFScXddtBlmB2XqxfyQ384FmgCC33CRty5
	8He3Jb91mxPT6bp/dVDM20XUK+8QxBGSofF2Y/Gvs7aaTqFbI5XHpd3d+GlKXUAtO4Si8myzdVC
	6fIbF7i4Rzuw7X66SHhcSvI5nLlfLtquhOg9iXvAmazPLzLBT3A5VA=
X-Received: by 2002:a05:600c:4692:b0:49c:ff8d:b548 with SMTP id 5b1f17b1804b1-49e619ad0e1mr258658675e9.11.1789310500681;
        Sun, 13 Sep 2026 07:41:40 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bfb5sm343158785e9.5.2026.09.13.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:41:40 -0700 (PDT)
From: German Pablo Lindo <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: dan.scally@ideasonboard.com,
	germanpapulindez@gmail.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Test for [PATCH] media: ipu-bridge: add the OV13858 rear sensor
Date: Sun, 13 Sep 2026 16:41:19 +0200
Message-ID: <20260913144127.17995-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913100932.92087-1-lsa.uz@pm.me>
References: <20260913100932.92087-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch does not work alone, it needs other patches related to the camera such as
 https://lore.kernel.org/linux-media/20260831130312.26296-1-lsa.uz@pm.me/
 https://lore.kernel.org/linux-media/20260831180746.68878-1-lsa.uz@pm.me/
 https://lore.kernel.org/linux-media/20260829-sp7plus-int3472-v3-1-454b50485ce2@berg.pm/
 
The test enviroment was on an affected device (Surface Pro 11) in various common apps such as Gnome Snapshot, qcam and Firefox (web cam test and google meet), all tree apps displayed the camera with the correct colors and resolution, the only error i found was that the camera was rotated 180º, making the image captured be upside down (I may have forgotten to apply another patch and the patch of this email is not realted to this topic).

I have tested the patch v1, not v2, the lines are identical so this shoudnt influence the efectiveness of the patch

   Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>
