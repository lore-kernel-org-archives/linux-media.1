Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BBA37B011
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 15:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092747; cv=none; b=N4fB7rNDkaVOd2fPqQfiUxXx5evCN5ajLufkOuk+NVd0qA0JRXMPKEooPF1m+/2R6lSxryWsRMxktkzHvnJyUTxg3MpDhASEtcwxwl5CYiCzyHu8Oq8HjGD2r8Nas8MCOKjgnYeGSXWuItUmQwETG3yVrT3+sEEO7GKOF3mXbI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092747; c=relaxed/simple;
	bh=DBGBG3iZyu0NQwkFQvdP/TmvC+LApjysEWaV18qOKrQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Hy9z2yS2zcbtt6hd5BbHxEcIO7xOvcfJz1OSZW3yutyOLyRGJhvP/Ux23LM8yX6ypjRCXC0rklDTwaj7Pkvo43WGbc3ZM0rway/zia9bb0hrgb6akNrZ7tI3unoCLnFsCcWkyKgES+mOXPCl3LBOy+s/teRNwcBA/eoxAtSKl2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=Evl9sUZO; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="Evl9sUZO"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso55971a91.3
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 08:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1790092745; x=1790697545; darn=vger.kernel.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hznwk34J9OCTjEzC99z8hQq8YeZFlpKU/C+qK1zz2eM=;
        b=Evl9sUZOmNrJq1uvEaqaGR0/7Y0yAlEFB8t+OJ5LadmyC66ncmgaeMSyJ5eV2t/kzk
         yhrl092vSk6LBPkaSX7iuAT6T2kktPyOEFwAaN2TTmSLp+80xATu6pp8h5NlR0Jns3yB
         6kFiTUzjWR7DDxosl5X5PrwIk4KlTCht0Wnf1vh5a+pRcnaO0dLAjMSqNA40yg2o/Jm+
         YVQy8ZllxD6tQyWZOVATVFqH3UTVRbORGPmw7prnHqauIO3piQgfNXrUyrguavPFE05E
         ore1CIqXjrH6Ixi5Ul7maPzUf3Tjmvi7LQ8VTKlGZxm+Gf7Eq+lHqveZJK2UgbruE/Vz
         Exyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092745; x=1790697545;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hznwk34J9OCTjEzC99z8hQq8YeZFlpKU/C+qK1zz2eM=;
        b=idmMEJW9ArBVlRjcW2Ln+v3Eb/qtD/zDNvVaUev83DVanDoKBt8zp0zkTpfH6ldhhB
         U0W/nk+5gQ2rG38E98DlyUxOw6Y3nNRobmxcbNK/3cB8PSHlVmgsELU94V0YiZ7dUEIR
         gyYhxDTwMkd6HDtAv5xaXFXRGj1kgCzsx3cmzshJNmS7MA51ZzCELxe+fd5ppXDzVh+5
         aC63Fu5MMsYYZVG7QF415ebOs1B+RKprjQ7XE5GcI8cTFwZB319YqoDK2LFCivNNLaq+
         WJdicf4umtUYi4RhT5H9DLhVhHbQVy0wYwuYqOIuho/SJSZ0OlW7eI7I9GiyTcolksfy
         /tkA==
X-Gm-Message-State: AFuF++ksVd01XgaejQwqNyREjXZbo6XK5SnHTqPF+DRNRUDobieii7V4
	5HkpoxE8O/1zq5/BCBv/ah8X8bjMvTsuuukp9SJfcr5DnZfSbYYUU33tv0ppNR+sxEN/frAyR73
	R15CI
X-Gm-Gg: AYBFou3L9PLrIZFv/SSzYN6fmOZswolSe9qQGnSTTi7v8urNZvllQYfg6A5V0XL5oAB
	nY+jXR49oDFhdUwyQykZfAef+PHlggh8BPL0UmBwRcFwAH0egDBT7RN1NyzwqY4qg2LEIWf1mHp
	6H72YcZlfbJQvxsUaEKZH7rPoE7OtE+00JtdfSTAqLcWV57X51ugkSW8Tt7rvYmiKLBzpWe7x4z
	N9auQCxyiDgBaBgMQ1ksPuU9dTgZLE9ELGrqBfQp57pL2UTVIqmUddS/vgkGNyM1a8DVWDdCRsC
	QuGKHfEJ/vKA9l06WGHuRtX7uRWTiBV+bwklQ9GFZz/WB8usHlN3yXKctzR8E/A5wOUW05LigPW
	EqJNFSC0p8ryLv3FymV53M0hXsQrjlrKU9t8AkzaQCoPSzmAJeqjNSHgIwwn09Qz1JE6O0y4opq
	oTi/KkgES1gcZbMRsKSXY6km7v6tsXfOOoWTMoxXX9ZUEnwFjkAa/k4vODhcHhBqIEGt3O6mg93
	g==
X-Received: by 2002:a17:90b:4e88:b0:3a0:309d:5549 with SMTP id 98e67ed59e1d1-3a0730cdea1mr1702562a91.8.1790092744598;
        Tue, 22 Sep 2026 08:59:04 -0700 (PDT)
Received: from ec7b70f3a45c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e61270bfesm5285423eec.9.2026.09.22.08.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?b?W1JFR1JFU1NJT05dIG1lZGlhLWNvbW1pdHRlcnMvbmV4dDogKGJ1aWxkKeKAmHN0?=
 =?utf-8?b?cnVjdCByY19kZXbigJkgaGFzIG5vIG1lbWJlciBuYW1lZCDigJhsaXJjX2Rldg==?=
 =?utf-8?b?4oCZIGluIGRyaXZlcnMvbWVkaWEvcmMvLi4u?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: linux-media@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 22 Sep 2026 15:59:03 -0000
Message-ID: <179009274303.413027.3158173373538711991@kernelci.org>

New build issue found on media-committers/next:

---
‘struct rc_dev’ has no member named ‘lirc_dev’ in drivers/media/rc/rc-main.o (drivers/media/rc/rc-main.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/drivers/media/rc/rc-main.c:2021:38: error: ‘struct rc_dev’ has no member named ‘lirc_dev’
 2021 |         if (device_is_registered(&dev->lirc_dev))
      |                                      ^~

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:36a247467120212cd254d542ecb5b613b84fe664
- giturl: https://gitlab.freedesktop.org/linux-media/media-committers.git
- commit HEAD:  05d9c515cf13056875abbf73adb4a19dd7ba32eb

# Builds where the incident occurred:

## defconfig+arm64-chromebook+kcidebug+kcidebug-arm64+lab-setup on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6ab2965dd96a8203de802a23

#kernelci issue maestro:36a247467120212cd254d542ecb5b613b84fe664

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
