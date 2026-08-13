Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F48440A15
	for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 08:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786608943; cv=none; b=hsReUoJ0mCQQeMbPCWOtjmLabSyr9t8ZXYZoXFGkz7MBXpvQ3yb/OVBSxprI2YpxDvEMU6hI5DDV/tEMKvZS9F6h2suZe3ebAAVk6FienTuRDlKQScCV77UFlCjMo5pI8RWpjOUKwVC+J54ab2XAUcwoKZ90I55lWbQtApEmsVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786608943; c=relaxed/simple;
	bh=CDW3D3ihlzfGcvfK3Kg26K2DWt1/HEjNmJeSJUhJbvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FmOSA64gB11p986nX7XGnHIBf+gAb4oUBzenjC2w728YjvOWhkBaMGLCJkc7LGMwTDictoGr60p7IsXQLObzob6Yo67WzjLHHuuAM7L/yzYn19PgbxoGUCLVjD+MYa/owLV3dVLthdUO0lor8d6BCqjQCjA0UUo34p+0nxypM4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CC00MD1t; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CC00MD1t"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90a80860d35so5335726d6.2
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 01:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786608939; x=1787213739; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JEQS7llX9UaH8wutbu1sfenYXPYeQd9lp24h870ImTY=;
        b=CC00MD1tkJyOZOt3i18gmi0nfaBLIKg320ZpsavgCaARrDRXGecJ4WPVLtmXPET+Gw
         6hX25fx5kmKqbbeQvcl1OWtbnKUMWglwj+Aaut/yeQaFxybgPV2EYxDeHvgr8YOKz1Mn
         e4TbbYzr+v8KoIkNydoizHIGf/6Ddk3Sa+01YlPvRQbDoTw2vDo/4dM1823yh9c/OXKk
         +g9IRK+gqJEZgw/009mLY+t37sYtfHNYH3gdWNNPw3WKZIgJBCJ3TQvWyAvH4/1i0foi
         SGCYFzZLnNwoezHp0Q08zPpyFBeP9YFnuLk1FBcPyolcw8Xa/I41L9gLykpG7Z8IFQKA
         njXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786608939; x=1787213739;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JEQS7llX9UaH8wutbu1sfenYXPYeQd9lp24h870ImTY=;
        b=q/s0Y/87Qxpv1H65NT1nqDdcxBiknFE7pI8SvhaN74ZRnz5OOuEl0IIlvNo2Dlo/P/
         NUethRk0QDO8Cib2QLKTAerrt3+sq8UPm3dkYcAR3jF9dHUMijUOaCWuuUFyBdVm8qZo
         g1T8B19JZsQaW2obwCO42nzDAygYuz1nCpoHfU6CsrJY/35r0+qggGrlOGNRWT4/qW8p
         ke3ZladV7JHw0B2sXZhMs2J2tMVPQ7qLvHax4wpITjDvvRoS20eMIct3dYMBdtnUeFkO
         Hh0lLtN8WFla4bYZ8RsXmaPB+fPeoqiCWxMbvdw+qKg98DArHp/2SkrOIIEPhUxQIKJq
         Atww==
X-Forwarded-Encrypted: i=1; AHgh+Ro2gAFhqYZeU89lWN0h7rpgR6h5bcuQ1q1h7Ii1aWU6Ubw2BUHTBb5aLAsir466jBT1WyBDkM/I8U4upQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt9az3cfwsSdcow5/O42qtl0J0gNlzs+XpYzprvuGwxvLp7nhG
	+ZnvO2X0mp2pLNchXSSNOxkA4f5+jwVhFCVcFezKsHAZIV4ai27H2LjY
X-Gm-Gg: AR+sD11YQfqCxd830UpI3fziDEfaZeMtE0rASVFiP1gytQi5WcUdYjj6etqE0d7CSf/
	QdEGtBYVA6KxYiwvjyKa2n+/KSXEXZSnjQqWb32w24pJ3dP0oWwcFmCOj36QAMwIavQWpzReOWI
	evjdppegWEZVbMClGjhaVagO1QsL9iotloySZvLLY5oEIuoj5ixfqRk9GiSmldNj074UqLkKuNz
	sV/trew705lCTE2PVPxwya9Gh9xuTzjIa9V7vRtbW9z1PiaH7wbhuHEF4BCb10ED3u7i6YFmjbC
	EKS2R9kfLFRB3ZNNQ5rnIjJ8pX9+rXF866mzbL7dZzS4tpNPMe9Y28E5TPQEYWgyWBGJgUgj89M
	2sLCyp3OHyzIle6KKwrAVTrLIs+/3Z8YQJaSh7HrtcnBCi9Hgj6bor9z/XhJTVBYzy6YnkSoQGL
	mgvFieLgpS7EhA9CESIRbKAGsCEezJGFVqIpkj9+66TKVbFg0P4PFTWPE=
X-Received: by 2002:a05:6214:53ca:b0:908:8f97:7d9c with SMTP id 6a1803df08f44-90a80b7767fmr39877276d6.30.1786608939438;
        Thu, 13 Aug 2026 01:15:39 -0700 (PDT)
Received: from localhost ([45.144.115.139])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a8179e584sm10187926d6.9.2026.08.13.01.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:15:38 -0700 (PDT)
Date: Thu, 13 Aug 2026 11:15:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rishab Madhugiri <rishab.madhugiri@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org, andy@kernel.org,
	sakari.ailus@linux.intel.com, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: Use ARRAY_SIZE macro
Message-ID: <an19JYgofcj2-5sC@stanley.mountain>
References: <an1vaFk4UrhQPkSu@stanley.mountain>
 <20260813075529.153217-1-rishab.madhugiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813075529.153217-1-rishab.madhugiri@gmail.com>

On Thu, Aug 13, 2026 at 07:55:29AM +0000, Rishab Madhugiri wrote:
> Clean up loop bound calculation by replacing sizeof(bds_factors) /
> sizeof(struct bayer_ds_factor) with the ARRAY_SIZE() helper macro
> to improve readability and maintainability.
> 
> v2: Move loop increment to the same line as the for statement as requested.
> 
> Signed-off-by: Rishab Madhugiri <rishab.madhugiri@gmail.com>
> ---

Thanks, but the v2 has to go below, also best to wait a day between
resends.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

