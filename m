Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D5B30E0CC
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 18:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102948; cv=none; b=L9c1rjFRvfn2C1fKX1FdEfp5/3bsl/jJgwJmgayAV3g4/2afg/VFzjjHj/WxwfdSF5lkyiQfHwZDkAjsC76UHgH9Y1j2EWmZ7rkJ2exXUiqYrQGl3BWien5nGT0LhEpQT6QHdDReaOMlefa1pL3WfOn5x3AYL9+VmLgBwiNtZ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102948; c=relaxed/simple;
	bh=hxBGVg1I3Scx5arwHErmUZuqdQcchgsL/BnGaHD6KXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9Vds3MPb9jH/EJHnEcoTes/51lKrlSUwTaMYw8FxQUi+RlaCswvnWNa1N1WQPGHsvo+/tnmfrRnNB84cPq0BbnW5/4b/FX/iOhE5JocGVRIN2Gp5IYwm8V4dUJEhwL2zk44YHMMvnDSi0FZ8ssMNxj8E6ZMGRlwkwEUNTqNsvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+PZACzA; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+PZACzA"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4728c12ba97so519202f8f.0
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 11:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783102945; x=1783707745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bxI7BvM12Nerj4aOhcbX/lZ/mvSXXX9U7cR4vYDN6E4=;
        b=T+PZACzAU3Z+o6UqtQlXQggO6fAQenhdbZMxi4AHXwdW4wP7yYBuVqsmHXh54c5uEq
         ArKcmDza1O2+4/ZocIVCHNEvkLTWqJhecZinubXA+GugaudOlnSYDUM2PFp23nsqOxJs
         9nzT6UYTZAu3pnz4C5lKP/kZgZ2QU97nhOi3qxrZFNeFKAViTmbBgvrnd/tn23xOwTPb
         1fD1PB9j0gtTAineiFdGDtKJWrDcDm64L/lhKVO2muZDPQYAVzQjwjtEA1dQ2EFU6ezV
         ZlFwzUB0Tv+cwt0Utg1EEgDJQJ9FsogxRUEl3JO+1HUQTwsN3VwbbhiNVMibcJmcAXxO
         rEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783102945; x=1783707745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxI7BvM12Nerj4aOhcbX/lZ/mvSXXX9U7cR4vYDN6E4=;
        b=oIxc1cIvRIGWDZnirGAuHWZ0F4ejaadfEhOMANvRgoWpFkN6jvBASzDDD+bsSAxP+S
         pTvi8/hofflZGQKSwo8Gq1yDPKAcTWPnWX55vC71K8+aB0itsGLfbJG7bxbwEllx3EGQ
         nqGt5Vxrb0fVCjaXuGWjqa0ll56UeC//2kJn5j6Qm/jO9xGuPb8+7rCljaeUtg3CZ9Nu
         xgbR6jSGQb3Q/fJh7y4SrFWNQ6k8ByyF4ChrrMM9hIysCS8cRd1MXFkxVyFYye0AseDs
         QNhgre/RmxgKcc9xyIboXfgN9X7PHinHQ2mpiKMwGkCFG9jpI9fuh8UY3pB2Bisgf1bT
         vflQ==
X-Forwarded-Encrypted: i=1; AHgh+RrEYBfkozhT8HjMEDRaVkEjDEmxjNWiCGSaj4s3F1+Gs0VfLaJjMGjiBMoUUtwGQmStVRFT83DMSp4OIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuEBT83rHSR8z/MtduUtNQ0Hc+03Aokcoh9YGo6vK1i4KiXLCY
	EwmmotFuIA3wldmmmeX2oyPytl1Cj6QMYpm1w7jilV4e891zz2Ar2km+
X-Gm-Gg: AfdE7clD9imbt7AvTuZY+GhGdm1OVSEAn0qHsoijw2h2xq3Vz1nEoaKFUV/ES3dsNue
	CVqQ8dqufzagt4Cxx2OzpkTpILd7S73py7zn8HpWIyzWhkuhBlcR/43ckbWyI1Zot3Gh+fkEPQn
	uAVxdPla729EzwEfMkF7QZsvwDLWyCTBhHU4kTywU/wcqiKq1Iq+KyP+UfzRX5ouEef4CgVlnP/
	zdPXjtTlsR8vst4zAP/iS71D7iigmhDnx85zOZPzJfYVbYqbmJ32FhE3H3crCr0j+30pUoIUq3h
	7nUduH+PeDctsFvxEXUq03244Wolv1RLYmYY0aXQCbtkskJlz560unGCEjkO9WQ3GrZGr6RJddT
	AlB6fCIzSUc+ogzLdkKCotFPMwwMJYTqeyFfD4N3aQEZXu92wu8rI8mVdHek+exwAYoWMv+NVVt
	aFhYnGN9BQELr9x2NkNnlFBBLnxwMIXBs12z6qx1RM8VOrmkvv7evVjdkHR48DAXMzFLwPbpKCu
	DXFnz3M
X-Received: by 2002:a05:6000:26d0:b0:470:258b:b20a with SMTP id ffacd0b85a97d-47aa96997eamr636555f8f.10.1783102944899;
        Fri, 03 Jul 2026 11:22:24 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9b4d850dsm1388530f8f.0.2026.07.03.11.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 11:22:24 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <8c2f0ddd-5722-43b2-baf1-4653de8025ee@gmail.com>
Date: Fri, 3 Jul 2026 19:22:23 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] media: i2c: add os02g10 image sensor driver
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 sakari.ailus@linux.intel.com, vladimir.zapolskiy@linaro.org,
 laurent.pinchart@ideasonboard.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>,
 Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
 Walter Werner Schneider <contact@schnwalter.eu>, Kate Hsuan
 <hpa@redhat.com>, Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260702072502.7907-1-elgin.perumbilly@siliconsignals.io>
 <20260702072502.7907-3-elgin.perumbilly@siliconsignals.io>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260702072502.7907-3-elgin.perumbilly@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Elgin,

On 7/2/26 08:24, Elgin Perumbilly wrote:
> +config VIDEO_OS02G10
> +        tristate "OmniVision OS02G10 sensor support"
> +        select V4L2_CCI_I2C
> +        help
> +          This is a Video4Linux2 sensor driver for Omnivision
> +          OS02G10 camera sensor.
> +
> +	  To compile this driver as a module, choose M here: the
> +          module will be called os02g10.
> +

The whitespace of your kconfig entry could use some care.
The usual style for this file is to indent by 1 tab, and then for the
text in the 'help', 1 tab + 2 spaces.

- Julian Braha
