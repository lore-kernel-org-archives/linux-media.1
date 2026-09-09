Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDE9584947
	for <linux-media@vger.kernel.org>; Wed,  9 Sep 2026 14:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965921; cv=none; b=S/p0uy+DLqdtWgnP0tD8Pf8HqM21wdtGR1VPI6jXPmJwczLUmtqdEpbLuWDa8FKz80KAjKrbSBIVqil+B/Jk6mBxlhETLDX3lydI/nZ266/QRb6vIAMxWRxVRwBfm7wYGIKlEpXCf93FE/ZH39vyV2pSLr2oY/+awde4Rmg8DFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965921; c=relaxed/simple;
	bh=OG8rM47+wQa5telCcXnv0ivoaCzuHrNel/g8JAXQwo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Upu1MT1gVI2Bu2lTbCZwnqAIQ8FtX+Rm51uNqjLUBi1WnQdScasiLr9XT7BvwQuASgbJ9aOqSxWxXOYKHNd6+wDXSRA7RPYo4Mtfh3CP67gA4AovpnPdmxVSYTqHjCKIMms8Iu1NSYoD/L/P3Y+g3Xka18rDSgf7u2tXAyZHuwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcrX/Osr; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcrX/Osr"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso4168915e9.2
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2026 07:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965917; x=1789570717; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OG8rM47+wQa5telCcXnv0ivoaCzuHrNel/g8JAXQwo0=;
        b=gcrX/Osr7jULvPpbVsiR/YE9EUyFW21uf4qekP/mL8NCiWrT1G2PD6OTMxmnXIrSka
         zqfBu5VH68FGtu7lDQVTDlvArzM+4iBhQ5nocWDOLp7d4KKrDA67U+PjVqCsFPgU+7DZ
         ZKE0IKelzKPx5DmCzVdVlSMBGfvaT2ywShlnxBvYgzaZiNssuHexjXI5QPVZDugjDpac
         hYRskKl/Htp256c7oZMUlEvnNlloEPSRqZbz0N7Ja+UgV7SxwsaK9XS9g/kRKaacRT5h
         nJmuTTSDM15tsAc2Yk+K1Vy8KAtovzExAWL1uYxt4Vms3KMrckO0QgYfPM4ni+OzpLVc
         8VNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965917; x=1789570717;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OG8rM47+wQa5telCcXnv0ivoaCzuHrNel/g8JAXQwo0=;
        b=PrroX/4RxaZSEQxvgF7c4/oowU3EuIXBwmKo+bcqUNbI1PuhZFt5hwQ8QvYh2OrFsR
         0FUvDq2OAx/zh1wfR9VBY8BBNk9pPgnKAiwfjPQD7lmk0KF6ymRbmJvwioaj+jOIRlIY
         4RwTE1yGNSldnFDTc/YG3srA04VGUCSnBx2VjSCH5uhnauEZktrSwmPaYoTiIRk7mX6E
         fSxE3/Gix3YfYGnyuHnntUooyJAj4KysheJTl8DBfCpDW+g3k9CVoJk/t0xC6lGo5KRW
         YccVKh98sMZIN3N0W82Hybh7L03AM4ng1Id9TUQ/18Cpv7BKj/NXc91ais9lmfuL4Aeb
         4fKw==
X-Forwarded-Encrypted: i=1; AKwUvBzvNNoXVsvcyfS2wvuO5yC4AnF14xJ/8jYjOfS8EYFOSJOF7DYdolki8mTIpMDYTTQ7P7AhX+ZdkJQPMQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kfFeEEZkPWOocv66Ydhb3aFNDrBntXK6UMP0zzJV+jEJu4V0yR
	VeLx2w0zx+HHtDMkbc5DToLBQee6gP5+ofXQklluNUP+MAZqt1J6pfNh
X-Gm-Gg: AYBFou1Mqxps2uIy27gpJbviQumcQRXfCfN1Bwo+TUA2EUf0gOTc6mhFZJZyvG8VylN
	ACFcAYyoeWCeJwI9j81QPRUntzArsYLiimn54jUMn/kB9BeZtvTplq8kFVxXXnzsOOGPmPSOH8l
	ca9X8Tfg+/hlhsyzwVzWaGlLYfsHIRsNUtOKrNexMCscw8xIaD8W3Sc4MQgtinu79pQcr7aOYSC
	x5VayiTltFCbKZekUskgOGMOiJEkl0wEimarufVwW7rcY7TkEUjV8FtTS1Kbe9vohLe+1aLb/54
	ocYJdDAq4g/1AWU75gepitH51XFbjrKJEYSMkDfpYhBolmGswuUpZwROQgx7i8+oBCJCkSKRiHk
	njFPmKc9JmUNo2R07/WjrRN61B64a6sdGOH27juBQniJIKW+nwIJY7IcfiWu/0SkvaPiFXXVG1A
	oq9Inf0D+AHl8VdTrf7ZoYARtPMvltd8pevonfx+hy07zM4DtUhi/Vaa/Qup5irS9FNXUg8pfLJ
	Q019g==
X-Received: by 2002:a05:600c:8b88:b0:49c:f512:2361 with SMTP id 5b1f17b1804b1-49d2593842emr34218375e9.14.1788965916931;
        Wed, 09 Sep 2026 07:58:36 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00a5b19dsm423987255e9.2.2026.09.09.07.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:58:36 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:58:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Breno Rodrigues Alves <breno3011alves@gmail.com>
Cc: gregkh@linuxfoundation.org, torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org, arnd@arndb.de,
	linux-clk@vger.kernel.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH v9 1/3] interconnect: mediatek: fix Makefile typo for
 mt8196
Message-ID: <aqF0GLDB5a-P-uvq@stanley.mountain>
References: <20260905130925.7115-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905130925.7115-1-breno3011alves@gmail.com>

What changed between versions?

staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

