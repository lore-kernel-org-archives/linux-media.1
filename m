Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBF6307AE3
	for <linux-media@vger.kernel.org>; Sun, 27 Sep 2026 05:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790485421; cv=none; b=CBNCx+GN6sBdUMLsgizIVlYqNu9Y5truWeWH5B5npgWoZhptWa+yXxBui4sI/fEteGctFKQu+LEE64Jb68HXtgNe/MP8/Qtj2Kh8sqGxVr0Jwu8pdf+B55hYSXtvBDtyBtYqOPUIcYHFh61EgIPAScm1EWDPfh4mZy0mc+S5E24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790485421; c=relaxed/simple;
	bh=OkGj/gFUATH+4urDRg1rQS1ic4wc3REFXYEGfdif8Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dhtmp/BczB0IDlQC1oGJDnRMe1BaeIoCXinngexTk+oC8LvcUYw49HFRE3UelUxbo1zO3wsZInL3RM/dzwoAood5HY5nAMTroXKGGbCCh+zOC5NvmqzAIZNuA+kOhCTGx5Icmn7FADqmNA9crTJH5WcJJsvqCnwmqf9a3GJwbgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3ikuQeM; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3ikuQeM"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso11736125e9.2
        for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 22:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790485418; x=1791090218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=//8jkoICP4bsKAR35DGTV7rJTfBjxZhcdrzj0VonkhQ=;
        b=h3ikuQeMRkUCATyocCXjkNQxqpPfknF4lz+MxAtz0DOIJsr1U8nerpvpd7mZO00TgI
         IHUgC9vgRUP7C/QVTxAeNBGiLvPqFp4nPFs2DSpYatA4X/tfzhR/kDzODccJUPHt8BiZ
         D4rdF+2AZVQfZsfgr5q8oDYSJ6XmbfC3Se32kiBQbNyeW6x94amkhII1ol+W2GWWqvQP
         amT2cA8gj3byN5FPi9FGTiloKhUpoijddIgcycHQlzZUuT8AKd3FOWFqhfcUsfzJVyl9
         S8pl762cf4yMlJGJhzVHbSEBVL41+WW6X9V4pHWNQGMrVYeyfDTA2QYeJJyIICfxHQOQ
         g8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790485418; x=1791090218;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=//8jkoICP4bsKAR35DGTV7rJTfBjxZhcdrzj0VonkhQ=;
        b=mVYd7LOaJDH8THS4pT1cCd7A0b5GMjNSKXC6FpiE1Qo6jJhy2CbLjWlijP8g70jJys
         m9TikU6/KUTZjpMlKDfSBV5REof24HgSmQtuEcaRwAEHeMyb03aOR8BkVh1nrKXrft8O
         QMb4vDRmrZ/203QBR/OrSxR9+5HlXF5tH/55Ir90GZKx+3NPBX4DilKiqZq2ILBAuRce
         IchtiE8rw57mQC+U0o39FTRI43U81kg6ulWZPFmC8NAo67/yEf39RyRXiOSUw6wnzuwf
         dLexOrbwHUW2QH4SyzScvGi/m+gWeaTtBewmcxyHgvhBkt1U+WxJNrGVHIJwh6B/qA5Z
         wY7A==
X-Gm-Message-State: AFuF++noqevRHAqX0dgqZvAR1aj0yuzh2jywDluLEyWm/bMYz4wDzxJ4
	JyK0yiUp4+UGsf9OCVWA2ViuB5jiR2ux71HHSvu/3tUNpUrVA0c1tq9Z
X-Gm-Gg: AYBFou0SfFL4icnosO3yDAt9ZaV+69WJbtJ4++Sh+YEMlq05cI/Q0jUyYaNgxjkU1uA
	uNv4Feauzerlw0MbllLwLrndQeOcYhjSPx8GtrViLzydXbMjZOQjWPRZRV+2wwm6c9DWvTTXalC
	I/Ffj1xvsymHeDJ/zxe+Ffeca0f+mtlkNsWRBlokzhKdZuWrNrij4nUU5+Da0T5X5UFSDZxoatA
	RLY9nmQM8CzJUA3TlofWTwOwk8QuMS7iyAyUWsAccX+ntWYA++rHASqctIvSoCIpUspcDx4gOt9
	IflBiHy5uBalDUAgh4hEzNo8dOfkcdAA4N5NhVDaqnRV9e3XSzI+CMizk3k0kapNdPokLKQNVL3
	aRPu62Oag4WywdSUV7NG0OyRsWv2Zwg4yqsu3Rudp8bDGxwHjnZyhHlOMsI+LFzYAWwJc9JX6sv
	TaMQ87cIEKI5PVjHCGySoWjV29bHirnNf0ZJHBbgisapdK2n7yCkkxiWDKEKHOKiEwEbZ30WXox
	D36WvuIyY6LvB6Y2+IkmZjVvp1xNXn6IW+Ib12hzvB2Vwt96D68Qc2p0kotnKsYMAm2bEb72Ld/
	xobqL/s6bAAji2JijUpjocaKux4Cj/GU5E4IWyRqhqcMCUZb/F4tNOe1R5eyTmdz4QG30ubto3k
	DcPewfp8BWgjzHKm4ckayMAeNGVKT2PoL49D9uzrzRQ==
X-Received: by 2002:a05:600c:8b86:b0:49d:1fd8:b874 with SMTP id 5b1f17b1804b1-49fe66f13c2mr181189585e9.19.1790485417778;
        Sat, 26 Sep 2026 22:03:37 -0700 (PDT)
Received: from [127.0.1.1] (host-95-239-230-248.retail.telecomitalia.it. [95.239.230.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001904513sm40667675e9.10.2026.09.26.22.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 22:03:37 -0700 (PDT)
From: Nicola Fiorillo <nicfio@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com,
 mehdi.djait@linux.intel.com, ong.hock.yu@intel.com, khai.wen.ng@intel.com,
 antti.laakso@linux.intel.com, manik.bajpai@intel.com,
 divyamani.tripathi@intel.com, nicfio@gmail.com
Subject: Re: [PATCH v4 1/1] media: ipu6: Start streaming once all streams have
 started, stop when not
Date: Sun, 27 Sep 2026 07:03:35 +0200
Message-ID: <179048541571.1782196.17072615250479346641@gmail.com>
In-Reply-To: <20260926182557.1295857-1-sakari.ailus@linux.intel.com>
References: <20260926182557.1295857-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi Sakari,

On Sat, Sep 26, 2026 at 09:25:57PM +0300, Sakari Ailus wrote:
> +		struct media_pad *video_pad =
> +			media_pad_remote_pad_first(&asd->sd.entity.pads[route->source_pad]);
> +		if (!video_pad)
> +			return -EINVAL;

Thanks, that covers it. Failing the configuration outright is fine by
me, arguably clearer than skipping the route.

As per Documentation/process/coding-assistants.rst, my reviews of this
patch were done with the help of an LLM, which did much of the reading
of the code. I checked the findings against the published patches
before sending them, and I am accountable for them. The Assisted-by
below is about my review, not about the patch.

Assisted-by: LLM
Reviewed-by: Nicola Fiorillo <nicfio@gmail.com>

--
Nicola Fiorillo
