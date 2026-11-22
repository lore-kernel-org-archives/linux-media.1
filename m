Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795388003;
	b=xXnRCvmDgT1qOdL9CurrEmTI1ZsSLIP7UmE8rMeDvhDJ+nFTYFnxZZNaQAjP+naMu1+A
	 zicThOTkUwfcJ3LpGoqu5VnxBW2Dk+u2qYv2LJ6PnUrvIDl776nZ+i4zR6D5fVOB0+MV1
	 uXxwaJNVY5Lg0rFwp6gh9Rii6E8bb+xdaUc2L5n3fLLMXN1RmMkZ95ogg64qM/pS/e1Dw
	 UYMTu8ofKrP5NJytRjoRUzz/kivElxmEoUiVtPXpS6P2Knu88vrkMac99NBjzPCOx/lJw
	 Gb4LfIddpc8uu/o9BJM8+22CCPv+IGQSC2JvAaRVxlPDt6T6BE9Vx2qrwzj7GAjxdOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795388003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=e1ECXh1hasiwdXcRUR5rhQfSSRL3Yk6j0MhKS+MF7ys=;
	b=eUcj192B8pGSFUWLS0hInpbgI5yZrwadjzZhT4V8zjSa51p80NRA/tGoqWNSWRwaC99i
	 XbSQ18RoVbXF88hhHtckFpU2QYHiLPFXabm64eQzVvO5+imA0M1rB7sFNVS3HMOXEZUNZ
	 eK4Sf8qFVDSvaQcLCun8DBW9YpIrH3pg9q+Y4AqXrwz3FDNsaSr6U9SsT72WhBMl3lhMX
	 a04IRodaAD9L93CMJn8s+uexEBEuvyPUbddqtINWfBRmUHX0jbpvaBpG/TyneiaSz0Jnm
	 wo6ZCAwtWeYGJjW7xc2LJHVMIrdX5oRhYYLFFLVgVuhU45CubMcLzDLpzAXXVRAllJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nI/6bUA/";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977D0606A31A
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 22:53:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 977D0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nI/6bUA/
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so25401175e9.2
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 14:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795388001; x=1795992801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e1ECXh1hasiwdXcRUR5rhQfSSRL3Yk6j0MhKS+MF7ys=;
        b=nI/6bUA/mOzT3/axZ39pmChOGMGk7WsLcDl2A9jJjUyG63dl4A5lBvvNxY8IuWObBD
         kWRs+8PxXzuOhkJOQyT06w6q/VAte2AejNce8yUc2ZcK2gqU2pYuoLTIq3mHaFP8vS+B
         il49OaJXWlJ7TFxr3Y2JRIUmv61noy3jUKLkEw4WrxVl6VDCqjpY2OMXQy/xohnwtM/u
         2nqIz0f8ulM3E5oNU8TCMM36oXdPbfbaXNw0VJGMAMCCqq5/XkOgTPEvkjlH5DSNEo2C
         G6Z1/iMxLTccX0YMcTgplzzVZcSGh9J+eYiXLte13XdgeQl09QW/DjLiyx7Fi3RHPL39
         Zq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795388001; x=1795992801;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e1ECXh1hasiwdXcRUR5rhQfSSRL3Yk6j0MhKS+MF7ys=;
        b=j+47HpKiSA/58VCbnK8ZbfM/xzxE65kAhdIOF0SZ6Ew6JY54M81THwUcVF0TczqIk2
         VQGJv9RqcbJHlwvxeD4uVJCn5MznnKIUqby4xEq1eh/8JSop0USJJQMd6c1b3j/ogady
         XyQL6VqPP/EGc2r/u87T6F3NWX4VWz6z3mvLfTj6wf4ICKJIOpVKqLAAzuIKd5NU9dbW
         9Ct7jqi3bYd4vqW/pI+roCTr79anuPVzZRxy8hFuebxfUWU6GEc0MeUmJLq8VplyIgYN
         SjzMKKYJ+LM99viXbg540nob0y38GWwOk+U1UMLkHOj1oINChkYHXfZsdJiQzlOKsKub
         tsOw==
X-Forwarded-Encrypted: i=1; AL+hErElZdSfjyq8SoSwnICI3bveZMBDzpDWZHp21pJGATtiuD4zHsEti+jHeqjxR5JtMSM0FjFYZdmM/mbi3Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z/7AZ4hGd0ij0pqnuV7T3dbYLjY/HR87SPi1TtuSUHbDYzt7zrt
	giRapSacsIHOayodIbiCBrWF4oq54l4GgEsuv2KSebMzTbHqOOir6Qvu
X-Gm-Gg: AZFdTZclaFKqg1Gi40q/5TE2qM0x6CWrtULIXB4pPn5W9fDdw65bC/QtN2EnMsDEzbN
	RGmcfrECo5WrwiEW/rMrv6X9heQxmNw7XT5BacxaSHjD7HS5hKpfUsw+Kl5UHSfUIUybVq3kgLR
	HRKjuPCVM/fAjG21K+AIDC5eyZlmkjEEwV6flthewv/aPzyoiuRdRpykcEyc6DTL0eCt1BaGJUL
	D7AionSMcocNMDjPiaKiODuUPBnefD05x1mOe22TaMKD6YT25VVfSsx6fhO2kJm/TqWufLQDemb
	2GOjUDlVMw9+EuvJUKY518Zb69seCdsMNijJrN5lwCtHoUTVSPrWwzp0Bj/kmsHTDLufvRDiumW
	occKBo32HEIbZP4Jtp3nb3D11Feo7fQ9eJhlzegnZwxXj8L0RhX4l+LJeFbSqv9ip2NOSQgauhz
	RvhQvjdGiDLewEmUbSSRsVT3U7N0AAaoy5af61kDtalPFwfpdLlQwgtiynIcOe1AOg/GeCkYSfz
	TR7yoz5jpbpPDaP4HFykJ+Po6IBOUZHPlZ+d8dZxFSN15jkXNq80ooiX/gOE5sd58kf8IQkH1rM
	Vtr3qVq314q0CEitWmvlojlyXnrSFyzJwP+nNVdC3Q==
X-Received: by 2002:a05:600c:a51:b0:4bb:5f43:23bb with SMTP id 5b1f17b1804b1-4bb88828173mr190830185e9.33.1795388000825;
        Sun, 22 Nov 2026 14:53:20 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb905f1489sm147668355e9.0.2026.11.22.14.53.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 22 Nov 2026 14:53:19 -0800 (PST)
Date: Sun, 22 Nov 2026 23:53:25 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: hi@yasunobu.dev
Cc: Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
 <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mathias
 Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Batch StreamCam unlinks on ASUS
 ASM2142
Message-ID: <20261122235325.3526f7bb.michal.pecio@gmail.com>
In-Reply-To: <179509825333.7.16183167217667709685.1785923683@yasunobu.dev>
References: <20261119-streamcam-batched-unlink-v1-1-076bc02866c1@yasunobu.dev>
	<CANiDSCsdaokL_2u_74b3ADT+U8TXskK53+k+hVA8D+PtttYEZQ@mail.gmail.com>
	<20261119141956.2f320b1e.michal.pecio@gmail.com>
	<179509825333.7.16183167217667709685.1785923683@yasunobu.dev>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Nov 2026 14:24:04 +0000, hi@yasunobu.dev wrote:
> Thanks for the clarification.
> 
> > Does it work, including in high resolution uncompressed video
> > modes?  
> 
> On Linux 7.3.5, 720p30 MJPEG worked on my ASM2142 at SuperSpeed.
> 1080p30 timed out with zero frames in YUYV, NV12, and MJPEG.
> xHCI logged "status 13 not part of TD" for ep 2.

That's probably same thing I'm seeing on ASM3142, the HC fails to
generate completion events for some transfers. But the same HW works
in Windows. Running Windows 10 under QEMU I see two differences:
Event Data TRBs are used to generate events, and transfer buffers are
split into smaller chunks no more than 4KB in size.

I haven't tried implementing Event Data, but reducing the value of
TRB_MAX_BUFF_SHIFT in drivers/usb/host/xhci.h does seem to help. But
not all values work for all alt settings and I'm still not sure what
the HW bug mechanism is and how to optimally split the buffers.
Maybe it depends on burst size?

You could play with it on your HW if you are interested. Your camera
has some interesting alt setting with short bursts and high mult.

Regards,
Michal
