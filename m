Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794535695;
	b=A8SSHGDfEKpmV/RQ3jw1M9uM3gXS3e+ul/EP18UqkQ0bfmTn5L+vwcGWyg8hrvYpVgmM
	 5HK+xmsv5t80Z3tpWJW7m3eVmEUCEKtcb74EXZpZZRBWP0f0CeJ1OobbXdXCJHoK8A/6l
	 1OqWcPRTMAB+K/segEjNn1VyXI+oNkbI5dkYqIE+501HMyPfgh1HtIQE53dfqLn7qRajJ
	 +SQY7vclEKZnBV8DzVTSJgaH4a1lwZ5H5/jb/lGzyHeLQkVc2uEHoc7PmXYse8tMJf55t
	 8oCJbQsPG0KzVBjK7umSA8XBgUby+nNxuzAcO17bU2XhNbUGz08k4UiUsJmiz0Q7a9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794535695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=aNvdaJwzrU7dKbL8hglaP0KiPMauObfmKP0USfT2P2w=;
	b=1hBJzjbss0u39EepkGBHBh2ZdwSwixEz3vNZlpmnX5nd0cCvfgazYyO6Kord+qA+Eb/y
	 ZFAq0sNc7rPNwos8r/XH9xiSV5nqk9BxRbDUYrpHxIrC4w4ZDCG41DC3LnLkxNQDOnl9C
	 AAIjHrd8CPnkeWrWtz6D/9L9MuuHC1IcNCYfb7Li/fMs82eBXDOrPdjP68N9UGmrXfGKJ
	 k7BRRYUDIxnFEH45X6YMnLEEkno8vQhP0PXfPfMqDRzuNMx4UewnTzhJKmbUQuOv9Rf8H
	 oDwY//EIj/CwmF8GSlv57IGh9yfkr7PywMTMokI+gi05KhWbVJekjk1+tGSSOKB6Ulg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="klQO7//Q";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA680606A8A4
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 02:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA680606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=klQO7//Q
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so419108a12.1
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 18:08:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794535693; cv=none;
        d=google.com; s=arc-20260327;
        b=p6VaYXAsx9iHAHd/QK9Eql53xolUuERDEDcYEdJcDSEn7vhnf3wsNw++df95XCDOsJ
         +XtT+1fvcoIXlxLc/GocGNAWv10mHDi7vTPylYCLIgm6+BV8uXg7BPaiDFbVrcmtMuUS
         lAerjGSNNY5T3TwhnjhE+NpApOaV5FuW1JLrW5R1IWsyx3YHag9LNq3/OMwT+IxQYDad
         87yGtUz3ILU9vgjcvKxZmLvgyhiUCnr76238zm+ynJT/yMat0RFdDwdVvF90Ezf/3EMQ
         B+hDnrT2PyD7HYsXi5LsDrWZWIfbrAal1bUfq38/gchzfnA8AkQHRWBKD5PHfkF5YYqo
         UQrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aNvdaJwzrU7dKbL8hglaP0KiPMauObfmKP0USfT2P2w=;
        fh=1YjuDsldhuvsLg9IHAcmCnPjy0hDO33MmGBNHl0akeg=;
        b=cZDH0tvSU1Do3EKTtvV4FxfCHj6DKf8iaYLmF/yXgswMcVNwvBSwHwLS7Xcl4kB1f5
         HyuR0XEnJZsvg+NP6eE4mkQLl0jA4jGbcTpxLsLBtAtjLwBcTQR87rAMhEnT4SXTezYM
         tGQ84o84ncNo4GQMjHMClElx/LWTeg8JoKx3WCNfO9KiDB2ocud++ZyRz3mAaHlL2emc
         jzpVAfIitFWmgJn4q7vlf/9eRPyf48RvoHl7K/jnH9B08F2OlMBbVb+jnHR8HeGRUHx8
         NLjJSM8slOZnbuKLsv62vhsRpaXPAQ8pg2y6C8cPJnXUroWWklvfo4wTiX3h2MkRCqJW
         Tl7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794535693; x=1795140493; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNvdaJwzrU7dKbL8hglaP0KiPMauObfmKP0USfT2P2w=;
        b=klQO7//QtkDbV02g+GY1OMb3W1hSic4rJYk88HUuiEVnV5r3FG8JRUJwSbhV5qSD3H
         94P8F+D343ui8GrXJY04mxHXR7wzUoT143X+PFLuNOdHLlD/wDspORt0zXmfjzw4Rfxd
         9ZsjoGKCwSc7P2wgZ+mSbb3J0pe4iZ41gzBoMpkWh6H8WXjrUPN1iLp/1W+H/wjp4pEu
         eEv5gQb3IRLvhJD4mpelZiS9eY/kYinkX9ozq3pVHofOIWGBpjQtjj4+RIqgAShakbxp
         NbrKDUFqRIGjIB5DVRd/NpXdbKC8nSbem+IczdCrPWDPH0rU/D0gLNAP+gl86bjvJjA2
         symA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794535693; x=1795140493;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aNvdaJwzrU7dKbL8hglaP0KiPMauObfmKP0USfT2P2w=;
        b=Fyns9vgChyeKspnSa2ycjWo+Ye77z7uloSYM1lMfkAuwhhsO7XK98v692kFZ0kxiiZ
         ssDUHcmENI3bkzRasKbmPRHO2uqomAo2UvuR56aduGJgwARCaH5s3RHIQaeD8rBA3wxj
         f5+YqBAueX9V2Ot820/dHnOxuldFbfBv8HXP1B2uIM4lQtrfD23HdPyhGDaNhvNHwLTC
         5baJ26hbPy6fOH7Xdxou0MFrFMScWkoZDTd7qXMlQOjv/4zLpwROdzF5Nw4vkiHc2vJd
         fUSBx/X7nqU4PR3FasLZp72aNKjcfGCpozQxBSiTwGzlbCPOKDVj46I6Dp/1paSFQY0c
         hN7g==
X-Forwarded-Encrypted: i=1; AL+hErFiMZphZyyfygc8Ltg+RlRxJlWh+W9BryQYFr0RHtf1HtQ4cXjGakDtyYUJQf9VWaeH1rtI8x8Q4mWFdQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9F68LYaicdCTYBMslprIKM4Gd742WRLlmTIEUc7+1vCoioj32R
	/g6zof3/7Zqox4/cYAG1JUyGn91ft7f7RJs84TZMJAlo/Q5zuR6zh3sNlWdJdkTWwXUefxAPDP4
	z06qeCcaP3AR+c2btObtAf5Qxxp5iPVM=
X-Gm-Gg: AYBFou2Q0hAnTQz9jqlj1nEskoQGDdL3nYBDjSf/uHmOUDTHm4VMYVxFNQ2HdCqSLNl
	wnbd+dKMqNa8/FVsQxpgBnyMDlnPOfG+5douCf2+Upt8hA0nu6tl9cexKHGzDyhus19zT4vfcPo
	h7YCO6nGs+J9zUrrY61qxPqJMXETpFceZ85ATKg1TgbQUP1PF2vDhxi8Y1Ov4k5GQX5rj05acu5
	RnjzVeloebWZBy+bocqQbq9d/6z5viSza+pBBc7hFfxRLsVgJsJbEGYDk/NP/ouzKeB2ui1vDls
	YskKQCHS22Cscy5b2piQaZfVxj+hLs9cFPBxP6ubZSYe/S70o5Sqb44XyPvejZFsCc3++53T2Vc
	AlLGUOEw1T5i17QJtMp8cwwmukDvxU7Bz3l+9CwGzR9yWBixwODqAmFGW2AjL3++ftwSM9eU=
X-Received: by 2002:a05:6402:1f82:b0:6b4:21f6:ff48 with SMTP id
 4fb4d7f45d1cf-6b7c08adce2mr1021917a12.3.1794535692714; Thu, 12 Nov 2026
 18:08:12 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev> <20261112-powervr-sgx-v1-2-c69b84bac011@telaak.dev>
In-Reply-To: <20261112-powervr-sgx-v1-2-c69b84bac011@telaak.dev>
From: Gabriel Gama <operatingsystemsdepression@gmail.com>
Date: Thu, 12 Nov 2026 23:08:01 -0300
X-Gm-Features: AclHuK_17nK0vdrM7hFH-08XQ5C2OxqtJhKel7UqIVpBLviQdlvTl_RWXYPiYVU
Message-ID: <CAFGNeagBWpdG7a9A-c6WRiPsd4oPXcWai9o=xnkZDyY+axcniw@mail.gmail.com>
Subject: Re: [PATCH RFC 02/13] drm/gma500: Publish the Cedarview SGX as an
 auxiliary device
To: Joseph Telaak <joseph@telaak.dev>
Cc: dri-devel@lists.freedesktop.org, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	imagination@lists.freedesktop.org, Frank Binns <frank.binns@imgtec.com>, 
	Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Joseph, I noticed that gma_sgx_set_irq_handler() updates sgx_data
before publishing the new handler pointer.
During unregister, could an in-flight IRQ still be using the previous
handler while sgx_data is being changed?
Would it make sense to clear the handler first, call
synchronize_irq(), and only then clear sgx_data?

Otherwise, the auxiliary-device approach looks interesting, especially
for keeping the display and render responsibilities separate

ty,
gabriel
