Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793079528;
	b=UufKCKJBnXLPHbGH5XggCInL3d3OSfu0x6oJ8Dg40FWyl5120SNN2sgUfkp2bdpsha1K
	 /SPk9Qj2CyK/89FqIIR00jpVFEsviWjKh+ktPAiOL/K+ivR6dPCPLY7eMTPLNRErJ9zwZ
	 TLR++r50PwOVHjtyU6H5dmhZlp+UNqYqt1YOZoP5WxvwH/mDiRHDhwZQ0+rTzti+hmWDD
	 cWOvLLVZx/YEEwMU3ZxEbfJZo9r5msLoNf1k8qgaLNC3RVEDc69cz6cKW00hpm6emLnzJ
	 oJ1TiU0zE258gXsu08riAE99+wC8Q3vA9mGfgSUkXohL4bwdvPu/Oiod5UnTyuPFxEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793079528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EeCv2zoswoi1cyVuV3aMhSAQS6klpYnNlB3thV2Q9FE=;
	b=uVi2PeWyhKdTNeFViY2T9qweSuC/+er+i6scK5puCKqy1BIHmKiap1srFJqT8R8RndjC
	 0Obn3YB4gykjBUGlDHR9vrkS3hhTT+hs/IwJj8hN554VPi/3jANY8l6hxCXDQamJiWhtS
	 LZydvZK27SfSnXkCgeLYIsTPj+uDwVT5tRt0uXv/qHetnnCKrfjEuqrxnhp9A44HEiDzU
	 BiiONVAlIK+llx+gBLFOQhGcXpyDChiJCtqjoOgO1LXrrQSJw9jqe0IbOJQ/gHX6E9W+W
	 t/ZCuv4YCSPbVXGXHXsXwFgn0ZFAthQAeLHj6ZCsWYgyqFZHRNfe0cCfFU/RtSdhDAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TSkQFWYI;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2B7606A31D
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 05:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F2B7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TSkQFWYI
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so5587825e9.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 22:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793079527; x=1793684327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EeCv2zoswoi1cyVuV3aMhSAQS6klpYnNlB3thV2Q9FE=;
        b=TSkQFWYIAY24u+ILeLbmhdWwPjIVoVVXpqG5lie4a0TD0iurDBdtWm2LBlRGSeSCZf
         6QfeRhnWM6Vrj5Ub8z8ZmIrrNgO8EB8XgQo64WPWLLr7G1CU+HjPgI1StMuuSWc0gCLS
         QDjM9FXGo6H5PRN1URiNXrIGjaTNKQgQgFeEhyPBQUSrnxnfBxdvMGkeV9EQKyhx/6gS
         ax4CXmlwEya78+lnBJq0AosH+5p/vX5yZclku6vtb5IHoV8C3UAWakPgRaFT+4wBhl9S
         cO5/j4/Bp36DFC1zXi4hwG83TF++b6LaI9gB6CXf2SPtbCFDEVKglVDCS10L2zm0vUvL
         2c3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793079527; x=1793684327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EeCv2zoswoi1cyVuV3aMhSAQS6klpYnNlB3thV2Q9FE=;
        b=D59OduymyIpOgJJ9UJiRQNpgb9B71jTiJamuaHIXBC6etWzl+huWFf16ZkoPAELT4I
         cdpGbNzofunPngcsPnN65GSi7x4XvUMry/G6ruJse8BSpr5B/FqHz+3Fod39cFl39oUd
         l6I21HtW1KGQq35w6Gr7WhCBstBTRv+ZXRi4bFpVfQCnabX3R8VqzKAgecHu8BoyCl/F
         KoQd8O8/vqIvpGN6RL9J/Z+5uQmhlFIMUzdSUdIdkZ5N9n2BpBEGij0dpkK1CjMGDkhC
         Z4+JmiWHZ6zD9aPzJHGC0eLSyv8+ww+xdUTHGJOUSUK38RMumty5L5V3yo86iENu7Fxg
         cLCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwo/Lmy9dzJl0p605boio8dgXD3AsyuCjmjZ9VELQJ5J2RhzN8cGWyoM5BJ7aYmxYVOlx0cr0VXDMJyPg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLVef//97m/BT+I8G0Rr6KQ7ad9GcgltJKck8r4i2+LtsUEqODj
	d8GMd4qkR4KTaFHrIxmUkPNsdR3XQcsKouWmGIyK9AeaNOcb+cshPBYR
X-Gm-Gg: AYBFou0gjbtR3MTKahqo8O0JC2CYbDlzJ10pbXSdG6hMnGN0XdoJn1KYEZho/j4r8uA
	uYjooo5oautOGrjBX/dvPUVfFHlJhqzacKz6PZCxRL74KVRQ+KX0PPaSeNUf4FrktLPqDIO5HzZ
	0BZmbf+ndpdXRFxgpsf23o6m+FCL0y2Q4qMr1pnrZbHWPjHX/mUZGQecOlDBYOoP8spyANY1X8Q
	aPROv2iJTDGvjD2clZOy8iXPZKU95dBltyBvaAVzo0V6Xho6uN/AnkDsk2QUGTAft0wuvKX5QjT
	E7v1XfgHUf4k39l7KIMz4Cda/bKlLzlGGjry3jXbb3FrApvAq+3223ONhve0Ad7AXRJSgLW5Rn1
	SJeT/o0Oo/N5PCG3cOaQtlBMGSmRzWzh6wcAMl3/vaGQxj0nUo9t/1MwsG284LRZXCeOl0y+A5C
	9IdEXYpuudUqfrdp2HAbmz+QEWdXVxB+6lmp5i8u4fvsb6KxCkZWL516qZRpGqweWREK234ngCm
	/uqeJdl6pqPNWZvZ6KqC6NT71goeNobAd+GID7/uZAnrpCiCRhD
X-Received: by 2002:a05:600d:849a:20b0:49e:795e:ba89 with SMTP id 5b1f17b1804b1-4a7c3856e2fmr26530125e9.6.1793079526864;
        Mon, 26 Oct 2026 22:38:46 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f248sm20057407f8f.6.2026.10.26.22.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:38:46 -0700 (PDT)
Date: Tue, 27 Oct 2026 08:38:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
Cc: dan.carpenter@oracle.com, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: Fix memory leak in
 atomisp_alloc_dis_coef_buf
Message-ID: <auA44kPevsJUudhR@stanley.mountain>
References: <20261027001940.20565-1-sifat.yt.2.0c@gmail.com>
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
In-Reply-To: <20261027001940.20565-1-sifat.yt.2.0c@gmail.com>

On Tue, Oct 27, 2026 at 12:19:40AM +0000, Abdullah Mohammd Sifat wrote:
> Free the allocated dvs2_coeff memory if ia_css_dvs2_statistics_allocate
> 
> fails to prevent a memory leak in the error path.
> 
> Signed-off-by: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>

The commit message says it is a bug but there is no Fixes tag.

However, it is not a bug because the memory is freed in the caller.

regards,
dan carpenter

