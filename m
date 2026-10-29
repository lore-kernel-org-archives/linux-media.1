Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793294326;
	b=cfyUU2vUWk3PMkOOLDDSnhAR6A5zgf/k6yknFUhbWptX7n781ABGw29AglTZ1he9keMP
	 iy+YiFwCH1XifD6S/JjC5erK/vbfm3FU0f5tn5cH1c5fV2WY948JpZQ8b5odQqaXlN6aD
	 pGTzer2cO46LFNS0HR7BNgw1pam69DIz0yPUW+j2+fmbPhwKzcIV1WwGWuzk/p2ubRdpJ
	 v/dAfrXTuxUyIUgYqebtdsCfqoh41y/hej90HmtA3MjbXVu10p+nCGocLLDCCdhbcW0Bx
	 YdcGUcQpHMSpBCqfuCBmp4mnoz2Y6myzFDirddtWwmG4q31CWZZz58v69UcsIbhqr5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=dFKLhXBlkA8pRyjNJSGOZ/8FNYsid2vBNfEp2bvdi+8=;
	b=DcCcmV4HoojwcKlZNhCeCcbmDmLP53/xgPj4LwdygkLT6rtLRKG3gwnj5fVmVgf7aO3l
	 DwE08cJcbzGyv6aTZig6YQZGDfc91QybPBmfjylf4t9O3HfChYd78Mp+t+CPBZ5l7XC/g
	 E+8a/o8ChJMAw8ENIhq7t2RKNBW39ds8p7h2E8mELhz46nTUwCFUqfQ344Ka6xl58QL8X
	 WoOT7xRHgbK/kPRcZNPMiwGED7fT/Qz/fFq5WB0vl98E7rUM4O7NZ6/1lLwOlusDN1ubv
	 1AWttN0MfVhufYdSa/ZY8YAaiNVQ6TGPNiI2UBYn2RMN4md+/y1TtePbXkaO04int8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=b5KQ2lYS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5601606A31A
	for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 17:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5601606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=b5KQ2lYS
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-70b875f6f13so1803359eaf.0
        for <linux-media@vger.kernel.org>; Thu, 29 Oct 2026 10:18:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793294324; cv=none;
        d=google.com; s=arc-20260327;
        b=IyL/B5/XUerorHof8ueEUzJ0pBK8pRCLeUdLsm+4LdppV6XuTfzumKQJNBphFwIqYx
         BWZX3C64n6tKS1Md7gMe0uoxG1Bdnc6QJRHNfMuOeHUUmiAc59rFeKL/HU54AM7+JBAg
         guMevRXkkUujcb348gS8hLD6FKJH109o56Mm89Qjz051QUFkySDjsR3WxAuC+D7/1WXN
         3g/JbXo/NkfPtvXCoB0RbXq03LxS+X3i9/PjgIS9KSTXjKWcB0bkYRhCHRKcxly6OaZ/
         Uy7j381R3zaDHmnVwEHlVN+x2at2YrfmQYgCgLrqWwRQJktc3HavZaL559XJEtQGLp4e
         lYzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dFKLhXBlkA8pRyjNJSGOZ/8FNYsid2vBNfEp2bvdi+8=;
        fh=b9xnAV/TL4uS1p6CA3GIab0RmD+0UZpk5QwUJXAJ0GA=;
        b=qUAnqDRRmc1VOZ95naHPBvPC0Ymqna8B36SI5aPd4Bqk4FHHGDav/2NjEyCePoOZc0
         f03nOPY2SFCEwi+hVSq5gmzf3gg4CfJBrVywcXvWnwEwBgQ5Yr8U5R2DKiy9GTZKJ8q9
         ti75OJeFFKwLw/aGnlwilTSsWItg1aFR5tf2YXM6lYtL7+kzNU+bbS71UqLLRxhwkgRq
         coyDexJenXs+YeGJY6z+2+NTwyK2b7S5CRpKTeW6AEXxhHS6Bc+9BSy0rVNYUAd4KNLC
         FS0EuxQbMs6jEZxBx1YSJJSZ7xJTyAvlxZ6ApC9TjtypF9Gth4+goNANSOMVwRYcPOQe
         94kA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793294324; x=1793899124; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dFKLhXBlkA8pRyjNJSGOZ/8FNYsid2vBNfEp2bvdi+8=;
        b=b5KQ2lYSxNerltYtHigc8dsXLgdQytyZsMhlbKoquFGpbCqUw79L/N7+UJw7ox8Hb3
         7DBmtTp0FwugbPFY5e80g3iaOaBpbu8qQp4GLVaFfvNvvZbxQNky7QbBqqEMPK46L1V4
         HygtrE9kUsiZ79UYvAbcB5ouDsPwWOM12D45IF89Ny/45md5LqmP7/fWJXIXoDs69lf6
         eZE2IOmEKLYmdsmL9N6tPDlnx8pDeTnP4MX5DMLockfHOmaeNTx148QyVXKDNK6sXkGL
         QB+VR47Ob1mYXNK/PBTfy++vQxbvsvNKiSVO7SCZBXxMDC/m3qLgyj/anjNMO9m00MIN
         gIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294324; x=1793899124;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dFKLhXBlkA8pRyjNJSGOZ/8FNYsid2vBNfEp2bvdi+8=;
        b=ST/2FBvgsdYViXgIu6/z8n6hWBy3atdg6s7aGE54eLwPoRdNjAACyjZX7fKnHliii9
         kAUW91mwnVr8fF7er5LANO0GZIfc8cI5VUh1NXRBHtA3S2u47Z62dG74qyoBBtmdINqy
         wB1g5K3A37KJPcD5wLCTQFyI+nKKOWfxZMAJ63o7QvLnisccGMrwAVXpLEMXo5tzPaHx
         E7M+4OEWIBY6ULDcHsNAeWbajpItYD1NYvtYKCNDCvnz/8ludQyIsJaS0DfokyyxVlH1
         62hAiprWLRvgrLxjPqBVkt7G3PMwwms2IMMpxXbkxwMx73+syAtmFU97FoOtfKNEHbGM
         8UNA==
X-Gm-Message-State: AFq9FYKL3gX3nrw86dJPAB0G7iGklnMWjkPtnxOYIPtXJ0TqudC1mllk
	jUln0YsFaqeePJFlNagLrkHjy2c/cl+cmGU9+W1Vumpqnr6NsnnMkm7M8VfLAHMULcJvRf9lbhe
	oowAr8BzQJ9oU33mkxWuhdSBFo0Vd8BJsZNCxHu0FDoBj5GA2A1xNmqa7ug==
X-Gm-Gg: AYBFou2gYynHwLEPc4ketqjBS0E5eTwjA2pyPBrqHHD7PwN7MLUCLTlapco9e1y/7NY
	V7pwIN211NNfdG8nBPnVvyj5Zj+KRIGmLZ5bZOKvJT11gk7R+NPXHvukHIzTQ+gLj8pL82rbe32
	FmLAsA8Eop369yEFxr15FlhI/A7y1Pse8g+hLsGXGBhh5vD/JSNpP850CrqjJVwyhViA6jtvXPu
	y3b+XdNG/jA6GGJzjPSwO1o5tWeo2ei4Q/jFuKBmAr/+LsIlSJQ2IKiBlEIEQ9+ZOKaBqw1p7Ej
	mFDnhLaf3Sc0+fGnevnuZlc5M1IQVcLCW6606X/fwzCg6QENH5lmxHPpSvrLtnZ3/BZCxlaLcAr
	3Q4uyRgKU0ewx8dK+mADHVT6eeGZaJRLpHQ3GZ+tFPs/Dmvt0hXNI3zHuQAvw97D9m9+34iBQRp
	yKJsgGBdKQwSvAb3qcbG6XvH/kITi8j60wGKw9lh3NXcsm6JNwTKkDjA==
X-Received: by 2002:a05:6820:3389:10b0:6df:7bd3:21e1 with SMTP id
 006d021491bc7-713f23690e0mr2746880eaf.88.1793294324177; Thu, 29 Oct 2026
 10:18:44 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com> <6ae37d7f.d4759c36.21f552.d80f@mx.google.com>
In-Reply-To: <6ae37d7f.d4759c36.21f552.d80f@mx.google.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 17:18:28 +0000
X-Gm-Features: AclHuK-sdO1CHdkLHZlRthkszghVPlf1x-iBd-spLL3Y2Y5dvzuBtbfJED-8pbI
Message-ID: <CAPY8ntCwohmi6=JmBWukJTXEQCmOk29nqwk7Se+xKKOJXrS0GQ@mail.gmail.com>
Subject: Re: [v7,00/18] Update imx678 to act as a common Sony Starvis 2 driver.
To: linux-media@vger.kernel.org
Cc: Linux Media CI <media-ci@linuxtv.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 17:08, Patchwork Integration
<patchwork@media-ci.org> wrote:
>
> Dear Dave Stevenson:
>
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>
> # Test checkpatch:./0001-media-imx678-Rework-into-a-common-Starvis-2-sensor-d.patch checkpatch
> ERROR: missing sentinel in ID array
> #1455: FILE: drivers/media/i2c/sony-starvis2.c:1450:
> +static const struct of_device_id starvis2_of_match[] = {
>  { .compatible = "XXXXXXXXXXXXXXXX", .data = &imx678_aamr_info },
>  { .compatible = "XXXXXXXXXXXXXXXX", .data = &imx678_aaqr_info },
>
>
>
> total: 1 errors, 0 warnings, 0 checks, 1411 lines checked
>
>
>
> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.

Checkpatch false positive reported to the maintainers -
https://lore.kernel.org/all/CAPY8ntCh-6-54Tp4c2srp_kAhaCs-gHixEq_=qMPf+rNSWsTtQ@mail.gmail.com/

  Dave

> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/114379315/artifacts/report.htm .
>
>
>
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
>
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
>
