Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915AB3A5E7D
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 09:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790414860; cv=none; b=vFTP2ZCicQFebTTexnvqJthezH5OlynrmI7w/nBmA3vpboC4FVj2nlO1/qe9Fd9n8JM3sNDsUnAUA4Ky6S0cydfLvFAdzgzQ+iW8AVs4xN4mhxpeuI6wlBcfsmnMvoX7Q+i0SKjEYyhKLnlUFa5GBsRZIfqgZm10s2yqm6ZhhAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790414860; c=relaxed/simple;
	bh=LPm95XpnLeXQybjSBPGU+TvJ2dM+a6JBCBNVIAJlkKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kqm8GyY4xLPahy34AwZSxaCZl6JweWXmPNuKhDnV9QqDdvhyoBLrGQttVO24uwJJGctABIOmslZv9vOzjxoHjuFqs19QBoLYHNFFDksBImCp1YTM6yOAKyFlhGdtV017DNj8+tm4skM4cOFd4y5jAvGAqOms7ouUANpd2952rAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6ikRdh6; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6ikRdh6"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so2228475e9.0
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 02:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790414857; x=1791019657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WfhSiXHQRTZVo3RbQYIEvZbWb2gG5Hiz9roKfYWz+ac=;
        b=m6ikRdh6FBJNJMOpoyGR6P8xdOm/kNjIv+x7ZxyMmdcDvhZJzGaJd30IfD44Gfp7lC
         uclK2ihC7lovaT472q+FrL9BwqCUm8g7CDsiyrLbhb40Cotn6PE0wP8/dEsNo7A5KVdO
         MjufvcwsPrs6mBxuzGloni2lujJNPhDxbTMSmt+Y0pdOfgcF8Yxm7CKnuGhZJjn2QGLR
         TwvpRCsz4ZT0ayG9pBAqWcyAmv/S0TvXuuPpC3grIQjZbHVAeOlQC9YwtnwSooLjxwKX
         59HiZUHIgNCElw9xCEFPQ3Km7M4/3atkIGM/acmZu0SLJ4Y5oQmxPk+dHrz92cGb8uR7
         5IMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790414857; x=1791019657;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WfhSiXHQRTZVo3RbQYIEvZbWb2gG5Hiz9roKfYWz+ac=;
        b=bf/p+rqmdFBJ+ArTgGIjHIReyv4/uRiAL3DLpN8iQPsZgCP8SM8buWmxMJVDbHtFyi
         eJJekRkyHZ9/bBNWXM/qaQ1DzD73nZqZUpFnYTlPa4LQd4tdYTmOYZ4Z7rEChw8jphaq
         NdvdfuVEVJBFdDNK/ExrzvP5s8nq4ng+pOkchny7PHNQOA/LUPz0ofjikZwzhBJSxjKr
         Ly6T6PEPv0yLwU8AzpsxiTjmNcw9OxQ0Oy9xgV4GUw+fpgeGIeQpRgdzEKQCxRyAOjCC
         i/e1LGnBvrZO7PIRlGnqQdl2dbctqpWNnxGDNRnqDg6xuVMdtap5dkggdu2JfrHI8XC+
         NaGg==
X-Forwarded-Encrypted: i=1; AKwUvBycGpWZq9LYhdauKEswxj2wo8RCW0ko+W2c8M8g26bSEDq/PYVn7RtBHEWiq0u+Q/+BOAesAUJ1HQarVw==@vger.kernel.org
X-Gm-Message-State: AFuF++npSHz4sm6UK2r0l1X7DT4XzeK0CL6sKavwhOt+UzzZ6RjNzMnB
	bMo9Q1EpJuneiiADjhIuuPC1jmhRkPqll3lRiYMbK3+cViLquv4nlyez
X-Gm-Gg: AYBFou0UATCeg8/UoKdIfnA5UXCCAsHgGt+tRRoKwY/plr5H4WlBKMWPrHHWqiKG9Vq
	x9+Os7kgvHfB+pWRBaTwP7NLBr3uDDjXXZa8bdTzohnVgNMAWsSxcbNVCyAnCnHXrMjqjs5IExM
	JXk5nz5m6ISVAdT4r86c1nzCOVAQrnlKy+bW8jNPWHYLgVxZcsaKrhopbIhOuqeVy0/Bz/o865h
	NpbtXD4IrWfWYeztQIgA7ll3ea3Y8UDPWfXPso3erjegSJHs1JB1XHHhYrJstp4bGUBCzoIrkWb
	vqOXby8OVJ/8uDAG0YBLOdNPRqUDO8jOMLsS+ksDYv99PGuVbVvjBMVry+3o+WvPCQjMiJ15lN7
	Fj/3xB1uSLhvQChwpVyhmE9MLNrNDizklnT7z1dx/SjHmz8yiU5iyiTcXNC5nK/lcDihTmWHWln
	cdajxhpoiHOmlwOzbbSDCZDwGstU2FQUR1XwC6tg+7dE9PLd7OmMhg3yukmw0MTzl9O+AlivQOv
	w6dGFxNJYFwRvnVSUfDp4SWZRM46n/TKawXD3Os8yGMLWGdNFLVQw==
X-Received: by 2002:a05:600c:4e49:b0:49d:1cc7:5ec3 with SMTP id 5b1f17b1804b1-49fe66d456cmr137424985e9.9.1790414856635;
        Sat, 26 Sep 2026 02:27:36 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06bdef2sm119604705e9.11.2026.09.26.02.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 02:27:36 -0700 (PDT)
From: German Pablo Lindo <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: andre.gilerson@gmail.com,
	conor+dt@kernel.org,
	dan.scally@ideasonboard.com,
	devicetree@vger.kernel.org,
	germanpapulindez@gmail.com,
	hansg@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	sakari.ailus@linux.intel.com,
	sashiko-bot@kernel.org
Subject: Test for [PATCH v7 0/3] Add support for the Sony IMX681 camera sensor
Date: Sat, 26 Sep 2026 11:27:30 +0200
Message-ID: <20260926092735.11605-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923211816.89954-1-lsa.uz@pm.me>
References: <20260923211816.89954-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For this test im using every component and program used to its latest version available in the stable chanel (the only exception is the kernel, wich is 7.3-rc4): mesa 3:26.2.3-1 libcamera 0.7.2-4.1

After applying the necesarry patch that deletes the line "const struct v4l2_subdev_client_info *ci,", the kernel compiled correctly whith the patch applyed

I made a thorough investigation of the camera and came accross the following problems that affect the camera using the CPU or GPU
 1) The first startup uf the camera is somewhat slow, it starts from a grey image and then slowly starts to recover the color of the room
 2) The camera is horizontally mirrored in qcam and Firefox but not in Gnome Snapshot ¿maybe the camera has a mecanism that Gnome Snapshot uses for the correct horientation?
 3) There seems to exist a bug in wich, if there is an object that moves fast in the capture zone (like for example, a hand or a person), blue and yellow lines appear in the area in wich the object moves. This problem does not only affect the front camera (IMX681), but also the rear camera (OV13858). This issue is present both in GPU and CPU mode, but the error seems more prominent if the object exits and reappears in the capture zone and while the camera is starting up in the first use, This error is also visible if the GPU is used and if you put an objet close to the camera (for example, a white sheet of paper) ¿Maybe is caused by the ligth the camera recieves?
 
 The GPU debayer is still broken but i do not have the knowledge or time to identify the root cause, make a solution, create the report and send it to the corresponding place
