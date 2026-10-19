Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55D13D25D7
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 06:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792389706; cv=none; b=LmPZY94A97y4omIp5kKhNQJMUU+QRF8+HCA99mGNcCt515OUEN9MoBGFohZS+dQiJUv6mSz6gK09Vok20h/rbfZ8rpM+jeumKLCXpvoquGHlB2rjLE0al2v8FxlzBDPmjpyS8SkC9gxmzgEtXpqjEHjoeFAF5teaDN3czr1hpRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792389706; c=relaxed/simple;
	bh=XNiKUw9XsPqs1tvz0kEFsEV2dN1YAqL90fZ7MLFvBc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TZfpt7UapYoCnLW5VtW9mpZdxt6Jwq9zqqC35lMU0EJljuBQeHFr0FqVTTu37AqJE81NdREOyCJvzm6JZkGNG1zBX6M2NMH5A43k4tGEUCPcRiMHJcC3qHHECFa7eVfpOh5aNundRv/DYxVCFJxHV18Yxqbuc2O+J1gk5hpRhOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVarydKM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVarydKM"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so12024795e9.0
        for <linux-media@vger.kernel.org>; Sun, 18 Oct 2026 23:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792389703; x=1792994503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XNiKUw9XsPqs1tvz0kEFsEV2dN1YAqL90fZ7MLFvBc8=;
        b=CVarydKM2wPlPmY7W169tHSfWFl/CO+e0ZQNdVNxHgnsF1cLhZdnd5KrzqSKSRIj3F
         BhjQa0+AgMTIBtzUv1gcIPtEkmtlAQelga0SCTVjqI4z/FVPMrlVHlQ5+sNxIMx0X6qS
         GON9q9J5eu71Mnt932uqrMTyDoSP5AHM8AKYVrCTe753yFILDipd+LYKyD8GboP9u5FP
         oKF5Bj/5+bjmxkVDc2RJOV+f62G1pg33r8rl+rYpr2JHAsH+W8W8XhrMn6QrDtsKLEwd
         o4cciSt0juX4Dr0VlVj48jQaMX2ozAwg4lvLoWuT0T24QFqIj8tt2uKBAj1Yy/4EXm6t
         QeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792389703; x=1792994503;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XNiKUw9XsPqs1tvz0kEFsEV2dN1YAqL90fZ7MLFvBc8=;
        b=wiEZP/uoqVa+nyiLAsHZn/RYR9yevxfuzP7kgszj9/Oy0KjMtndyk0vSAsyOfGntnB
         gShsatMVd0X1h1Qnkg3QgcHTquxRawShsfs3S2zgEGtwTqG3CFLwL+f/0YkJsGOV1F8z
         yMBGetUCBp8vUIEMeA9W/F5KkxcSpQ4maDMC+EqbocIHeAfEhISBpI9lWU8EHrvTAdV8
         iQHRlOhxs7mnHgj4+QoUCvq/vyLve4uV2WdZIgBQ7cErUomdDyn6YHiSFvNXroy9xPGo
         O5ZedRQkre8Bdiwhh0hTdCyxEdbpXR18I0fCaFLvcTUleOug+Y0XvJ5VdDE9Zy/w3rdh
         eTwg==
X-Forwarded-Encrypted: i=1; AKwUvBwUboi6o4+lqpXSj7DmMbaFSNvjiKBkkDvE1rwdtgoQzWUfL/FEIweHp9pPeVxhtnzyanmni9S5sBbrYg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLBA0UmjQz6sK5aN+ku7h08L0RnnpSwMl92rBGxyP5M8bKNYPoc
	4YEcqgM//HNVOeB4nuizr6qVnpWNfu1pSqVi91V8zNuvU0c6axQC3b+0
X-Gm-Gg: AYBFou0V+V3Rd4M9ulHvDnDMyBJXVTfmf4RkJAZOCKDECqsLLB0oYtyl+q84VSxInW6
	4OB2yMpRDc9sNOcpDCRaDBx8WB8IV83zU8kVHt4sUoJlOfKIDFVbF73o6ZQIu1nn68sjipy3ucc
	HVW9gOwQT7ElB+/rjnkctvVbetS4I1rrQOVZU226X8WM2AdAPybzGt1F74tzjsLcq63G8UdsJO7
	gY/tI2gGXWNc368+I4Xhjd5CSugcz8IEUbA+DfT4DHNgWJZUPd1ZKYvLzydftq/h0xQ7D7AtWzN
	wMsDXyvTDKu84iAu2//OgETWS2qmR1vSWTTwEQqrjrlomOMR4R83WUbC5/lDIZ+94+XIJkQ3PKC
	jhHlt+eb5x/IGtuvL/+FA1mC9YEkA++6mGmqbKrFb8X9ZdS3QM0Pm/f6Hy/+EBlGaGluefPDqBp
	FGWlUWtsy3dLdruz3f/UQYj63t3lSmcDIhwWXVqK9P7jOJdFRmKZPnboZTfHMdbqIoMj8nqIhUD
	ntLtV9e6oTr5jMXqy2OvRNNs7UR6A8j3Hg4fYKz55Lc/pDIKMw2/0kEr4CHQfM8TL9ws0/X
X-Received: by 2002:a05:600c:8709:b0:49f:ff73:9971 with SMTP id 5b1f17b1804b1-4a1d75f8f28mr128077975e9.18.1792389702573;
        Sun, 18 Oct 2026 23:01:42 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a1fsm17817528f8f.3.2026.10.18.23.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:01:42 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Sergey Lebedev <lsa.uz@pm.me>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	German Pablo Lindo <germanpapulindez@gmail.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] media: ov13858: device tree support for the Surface Pro 11 (Snapdragon)
Date: Mon, 19 Oct 2026 07:01:40 +0100
Message-ID: <179238891227.1168109.10270505331710088980@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019054322.3675-1-lsa.uz@pm.me>
References: <20261018-ov13858-x1e-v2-0-cd35434cfcfe@gmail.com> <20261019054322.3675-1-lsa.uz@pm.me>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792389254; l=701; i=geocausa@gmail.com; s=20261015; h=from:subject:message-id; bh=XNiKUw9XsPqs1tvz0kEFsEV2dN1YAqL90fZ7MLFvBc8=; b=DS7K/pbNV69ikcT4O9oFfkWuvpKoUT5+ggT/mW2lfw4MIoEmtfMQ6LjF/XliH8N0jK5n87w1q uwvJ3HiXCG0AghdVQjgFgM7sMmoQ+WnIBL20m2Anfrzo00reccsco6s
X-Developer-Key: i=geocausa@gmail.com; a=ed25519; pk=KyQk/iWbxsikewDBh0SwlHI51RvAqahD3loqmRp9DVI=
Content-Transfer-Encoding: 8bit

On Mon, Oct 19, 2026 at 05:43:30AM +0000, Sergey Lebedev wrote:
> Retested v2 on the Intel model, on media next with the power-on v4.
> Loaded before the IPU driver, the sensor's probe defers ("parsing
> endpoint failed" in devices_deferred) and binds once ipu-bridge has
> built the endpoint. It then streams 4224x3136 at 29.95 fps, and
> v4l2-compliance passes 46 of 46 on the subdev.
> So the Tested-by stands for v2.

Thanks Sergey, much appreciated -- especially for turning this around so
quickly.

That confirms the deferred-probe path behaves as intended on the Intel
model. Thanks as well for reconfirming the Tested-by on v2 and on the
colorspace fix.

Best regards,
George
