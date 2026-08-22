Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644C62BEC5E
	for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 17:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787420549; cv=pass; b=IeWWpNGUOR7U6jdurhUOwhzdzfd+rFn2UbA1w3WOBzHQhEv58Tf/iAvd5cnPKAlSALkBMkcfoV/SjzV2XF/pUcUFu/br5EjCPs8etuPDHWwZ3yra4CTw3+d/Xhvjv8/7Zjkpki8jS5LsGjIZAq0FdyMLPoC/R5HuT1yEkcfvEZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787420549; c=relaxed/simple;
	bh=MUXPKEpgVopyaXnDNXHBo037h+hV7g31ro6zJ2bxDlM=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hsDMqY8Oui9nzz+eO1nclC/Awi/9l8fTYqnMIpT6IHGSiWjRUy/yCqmm6jRAse0dB7DRNRPBzdI77Ro47orS5R2YaHxsVXGoNCayk3x3OTf2F2aaFMEL6guSMgylPMwiMCF+7EJWz2DPBc3JiGzFFafaBn7XSe5TAuEe/hL2xpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stromback.com; spf=none smtp.mailfrom=stromback.com; dkim=pass (2048-bit key) header.d=stromback-com.20251104.gappssmtp.com header.i=@stromback-com.20251104.gappssmtp.com header.b=vto55oA3; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stromback.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stromback.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stromback-com.20251104.gappssmtp.com header.i=@stromback-com.20251104.gappssmtp.com header.b="vto55oA3"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66b32bb75beso3205941d50.2
        for <linux-media@vger.kernel.org>; Sat, 22 Aug 2026 10:42:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787420547; cv=none;
        d=google.com; s=arc-20260327;
        b=bz/wat3VUnWrNtXc1gKx5nT++b8E1DsvMe4mduy7jsBN413SRZvYFVrTFU+cpw0NvT
         G3DpAQxN6dTlsXA8QNT9DdAZs2w4i5HgruyfiNjNN7kPzoQRdENTN4mgsx05Z45vVZfi
         Ofe2+rjaYRrgP5I1IiYVEOnl9Gg+46nwbPFNfZcyc6e5Y8QpVu9DH0RaGSkyQooWCour
         zVAEx0mXKzYvw+f5m3mKmAa6Mq+Qo+sXqMQQsZoRUsTX5Pu++C7BiMWO2UPAzXHcHljs
         Bh9XK6AWhdhuy/F/3zInj+8fI7VN3qMUhCy7/s4ylowLFZtbaDGEh96hw0+DRg7STxDp
         lMBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=FUppWfcoH7JR/0/7azdIyGolLl4Xz5IVrlo1YNuQoNc=;
        fh=66dbu1voUkBz53zk23rcb9m/TqMm2gCI5I6xokuB+ok=;
        b=eJmCvUB5X1Qm9GM0+rRgntLFYVd1krNpNEUj4gu6hWKBsG5aCKal6lRqKWe5/uRBqw
         VfQ2jZNDsmU4imjHC/5ZGI0B647kEVRloCwdRKbHeEggZVMXu/8WyhzcrLP8wCRX5Kui
         fAGCi7AK1grpWSyWlZmwzuPTsGthCqaA8An9bZKq6XpYvYXiZx2yp9pPt2H/Av7k6mTP
         z25GvHrCyQtg8s6nFRN7/JuIIToqdZFpyKEVfqyDJwOvcRJi1DKOA3OSuvQlXGrEI+gN
         Oq4Sa52u4qAwzbr0Pc+gwPc6VoSSyM+SfeNVVWZS/6kGYN+54iayH2HYImYS84sJQumI
         EZjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stromback-com.20251104.gappssmtp.com; s=20251104; t=1787420547; x=1788025347; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUppWfcoH7JR/0/7azdIyGolLl4Xz5IVrlo1YNuQoNc=;
        b=vto55oA3pYRmuE+TkO6ErbCak2DEhLF/jnZcxyJypqFUxHP++ICTcx/HE4RWrQdOOI
         UKaXczGgPTk2t3KOhlUXYBH7Ce3HU5gpFkvXonBEXw7fkJWHoV+Ubhu+Mn0oJwFYudyu
         WD4VlRtoeu4m2cH3+I7hpdHwfWL1IYQLs5Y+WbimnXc8mOp0MEfAsAnEAVIoPgzFvjFC
         sfB7jp5bDe2aLEgPMNW7lxFvU6tcfPK2qdjg0pnAFMUgUksPOK5dT2yfJjKA6llOE3cH
         py9Ald7UnX1QJFTMy7RUVG6hSu/SYLSBRBp2m25wwwqbcPT45v8Jsj88zFrg6/+g52Rj
         j+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787420547; x=1788025347;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FUppWfcoH7JR/0/7azdIyGolLl4Xz5IVrlo1YNuQoNc=;
        b=MGYVlH4Lim86eOrA3oJTVo5dNwrF9qAt5IYPg0mKPZGAiRqVpyxQpQIs+6oBNWzdC/
         f4VUZRZRvA0eDb7LD4zaJesVzyMdGR2vudsgwDPzdJpvRayybU0SQEK7d3/xjkvyuF3L
         MyAb8IiIDGOcWutjj2a8VDCVmqAINyFOdVIbHnn74EYzerJpTQhJUxu56ewdVdfjxGxU
         Lp7hOUgyMKHzR/R8+2cZvW0Q8Wj2y7TNBMLKxPe98OzJZHTenONfwQ14wGOP5a75lzz3
         7sP460ikDhq1Fv3bDha0RsU/NsDk/jNbDav4H060zpHOmtt6Vm7yCYgHKfo+pWe5SGzy
         +ATg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+BPzaqepkom60GtyZvK1AXS+EFI2iPou3nKsOzCHX9p7mayyVkIg7wUeez5bwQJsuGztFbvytsB2svg==@vger.kernel.org
X-Gm-Message-State: AFuF++kt/EH04LHy6dTmS8pdQO+F5bO8+FGbE8tfY631fv+HpRCHmTre
	MTazJY0Fif2ctv1/AZDBJxScT9O97/3bSL1il/fbcVBDsllhuZb3U/At5IKfHI2M7yHjUtnZsZq
	VEgOI6FkIClFk/YhiZDpqKWy3uau4iAVoTqcwiMxqaw==
X-Gm-Gg: AR+sD103Ikxh/f2SMEYJoQi/ibIOi4CAnh/jteqwVv4W9KEvZokzHwlCezcH8VKmEpo
	yscGL/42YkqbG8xXuJrx7Ft+m1jzJvOP3h6LuKhjnIheLHkL04G8jbcZwduEO9fxlY3Xd7vsurv
	ycgU4Z+2UEWcArt5u2958wH5TQ6G2eCtu4ZMLZBaN5sTfU6OiWj/LhhRsxwn811bj3+pcWLnwhV
	5miNYGdVWaf28jtn8Q/KA1+SNr2lKZN6Ss6Nm5EkPh+U+DAEjlcQ5lt2o75HjxjrxD8md/VaPcP
	jUKW1owZ/LD6yRXRKEhCIZs6M0ZoMNvjPS+DxlLGY40KO7Bjl8np6OURE2djFhCbZcS+lDJVHbw
	CwfaZHydaUAlSIoVVXQ/WcuIXjHpkSJ3fSS5Z5/7mDKf80Z55fuCpDzYXKl+s8IwETnHh3hqevw
	KpusmOQx+aOFi9+P1trOapLfvdS0wZ6Mh0H+70EsCUa4SgvGcOBBvGfI0uGsaAsiff11fJNOVWC
	VcDiOcx+y3YGWGi4U6jcVtiD7n3DKcIb/qwsJTvVAcDe34=
X-Received: by 2002:a53:acd4:0:20b0:66c:ec43:1cae with SMTP id
 956f58d0204a3-66cf220dd96mr1668788d50.41.1787420547350; Sat, 22 Aug 2026
 10:42:27 -0700 (PDT)
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 22 Aug 2026 10:42:25 -0700
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 22 Aug 2026 10:42:25 -0700
From: John Cronin <john@stromback.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <6a899e9c.0f75f638.43342.1cad@mx.google.com>
References: <6a899e9c.0f75f638.43342.1cad@mx.google.com>
Date: Sat, 22 Aug 2026 10:42:25 -0700
X-Gm-Features: AcwNN1XRtbUXOI7DdvWVHQCZiw-ltNiIFyKHRRXMhzGuyqqZ0Ophx1Ro40nRkVU
Message-ID: <CALr1FG-ZWOdEzjrNshyW746755szbRbYU4O8Pwa=R6uKagthhg@mail.gmail.com>
Subject: Re: [v2] media: i2c: imx471: return 0 from get_selection after
 filling crop
To: patchwork@media-ci.org, linux-media@vger.kernel.org
Cc: hpa@redhat.com, sakari.ailus@linux.intel.com, hansg@kernel.org, 
	media-ci@linuxtv.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks. v2 was against the Fedora imx471.c (different context around
set_pad_format). v3 is rebased on media-committers next (4900cad020c0)
and applies cleanly there:

  [PATCH v3] media: i2c: imx471: return 0 from get_selection after filling crop
  Message-ID: <20260822174205.4092670-1-john.cronin@opcenter.com>

John
