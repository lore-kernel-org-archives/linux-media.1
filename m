Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7EC47DD64
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 14:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162532; cv=none; b=pkzO5/5XREHZI77WrDjux+tIrXirc+Sgie6hqSOMHo7QEtSu0hXNmTx+fGMBSYwuvmiTbSded9qghRwgmj+Ydp5CzvJrO3EfDWuEWkbkgf/d2LjFapgZxs+/owbGfRbZyJLQQK3lrWl7SjzQGaiuJDX7LGetcq1X2ZnWFHgNc+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162532; c=relaxed/simple;
	bh=rGAz9fb+nNEBOFrLUq14PUQF3gGZWqKXG/3BQpMsX1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OSLge+iDd8pV303TRu8FcNumzWey2QopGrBF60EVG/lhwqXjPfsFFwREorRJakKgoFHmLfTBcphoLOTtwy8SR5ZCCLvcnBCtVeIDJThM9sKXDWJJykcMAhKNeUnH+gfvPhRjwotzKoeHe+YoS7WR7MuQ8mejbWFWwAy0bKShfOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icY/xRxY; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icY/xRxY"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso375255e9.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 07:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792162529; x=1792767329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rGAz9fb+nNEBOFrLUq14PUQF3gGZWqKXG/3BQpMsX1E=;
        b=icY/xRxYyqyQiJPefq3pXR4AiPofgt5rlbkHjt4pA7lsdjaffTO0Saqbjw3uOcm8pL
         o3SZFAPwIwhUxt6hA1WepPocCuxUk7JVvp4Gx0LCDQsj14TI618M2qSyaNzR2UcmqTmG
         VLJWxS8x3KEIquNT0O2cWUP7l7myJXnqPldCcprtvY5M7WGWZ9+h9f7ZRpv6FtfJXSPi
         wz9iAH3nyxWrEy7xIfCezWyzfnUERJy8u+bsPmR0kcDbEOiAa5pc89+Td3G6rnvys1oT
         ESNEjMBZgsHyr2oCdSlwft+dX5YBETberBwtjHKHI5LH8QUt86EqlI7acSd9zi6yTS7G
         Jmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162529; x=1792767329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rGAz9fb+nNEBOFrLUq14PUQF3gGZWqKXG/3BQpMsX1E=;
        b=iv3RDMIUDO2AElaiG2DZWYjC3c4ukuu9QjhQsMxOdTVqrGD7imYy9DB598hFEd5b/7
         9uUAy0V4rUzW2frH8EiLZnwfpVXSceNp92wmEV0HEvkgzNJ7pz/LIqg90PdqHs2mI7J1
         yecGgS2sq5CptqW7oSbhzRz3h2651fEJQJoRoXVD4fns/ue8zuPtHUmICqY48ClIXL9A
         /KS4e8jPouh14BM0nJj7wUuBglu71tm+GXPqoTITg909GPT2P+yt/otexB80ZUF1vchr
         pIy8JImtX1lDZ9q3xi96DKhg7mhlNDvw006RFxm6aCRK4+PGeqwseFV7bJAvwSiHu4Cv
         SM1Q==
X-Forwarded-Encrypted: i=1; AKwUvBw1Up55IYkRhDJTmO1Q8LrST2dpXLzfecKqga6kdHLANrsBKlPM0Lg8QV91l9flaazrHUgHzxgt+rXBLA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL2UrgEawkymOtZw5Otok5uRYPnDDP/J7pQm3dzXCqxEheblnSj
	9uGAhFy+03LvS2Jcfq94l38pFE417uGDkrj7t4YLn5+SIlkFnTWi+7Sg
X-Gm-Gg: AYBFou1lty6dnXpOOvH82/sqPdg8z3J940FbSMqzxLo+5Qg12aFkxvluwOxffYNGXmv
	NJBelAEy7UCOtuOwe1ZEo6Wf0/MqQjhrZ7BO8DdtSY4+gTypWtX4rPlDoZ0S4RRaGIy6r1wLdU7
	/eUz8FbhVpRrfOmAJYEJUrNBeQgZzdus1TdnckOHteE7iwU5bD+AifBJP818pz3OnsUSz2UAB8D
	V+fe5J6/IHDwEOyB35ZD9lrKShSQtBCiYRnY2livzPFBQn2FIQCFM8s9q24aCGDVSEDUlZg/ZmX
	GEGIPMx/JvzJOMvjIgoC0Dzfu8FiBftecwFOJ8TFx1iCVUu6RB2Ei+vk9AFlJMW+Pptpdo9CgaZ
	L80Mn+2jumVsox3TKFvzeytSGU42gTD2jO4E/0EArNvJHw01XJsTnaIkriND6XsVtdOVRhk6Fcg
	hkhFy7veb7AEl3DIdhg4m3O9W9DsGLDm4FOyXY8bXxrGj6ChCK3Im3+TUn+6M73SbRrZUG8o/LP
	JkXctL92qqmFvHURYpHAg1QlL21eP28FiIddMULrc75jGZEofHcoFC8O/YWIh36/5RHG+T6
X-Received: by 2002:a05:600c:4687:b0:4a1:811c:8064 with SMTP id 5b1f17b1804b1-4a1d7610782mr887435e9.26.1792162528843;
        Fri, 16 Oct 2026 07:55:28 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a64sm6031177f8f.6.2026.10.16.07.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:55:28 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov13858: Set the colorspace in the pad format
Date: Fri, 16 Oct 2026 15:55:27 +0100
Message-ID: <20261016145527.36737-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016130044.43798-1-lsa.uz@pm.me>
References: <20261016-ov13858-colorspace-v1-1-51f0379ada0c@gmail.com> <20261016130044.43798-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey,

On 16/10/2026 14:00, Sergey Lebedev wrote:
> Tested-by: Sergey Lebedev <lsa.uz@pm.me> # Surface Pro 11 (Intel)

Thank you for testing it on the Intel model, both with and without the
patch. It is good to have the failure and the fix confirmed on a second
machine.

Thanks,
George
