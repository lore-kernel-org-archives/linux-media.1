Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703005;
	b=5aGuIRSJABMXXyfe7WZTuCDAZPjLZzf746/jaVoyZekJcK/Bx207wB5BriGdhOla+e2/
	 f050/xyHbYLAZ981hdp68wbmLKfdtkE66UP9JTGEeL52ttn1d1Qyxl7MQyj3czx5XHNa5
	 9l8kEUykbByuJCf6aFVIk2mKs1Q3x9gZ5zJkq8rNfe4fsvDawhngZJd5QvWyHCujTtze1
	 uDZWoevkXMRY/UbFHMayEOyaXObbbmW0eEENDkOwlr6iXKJ5fD6dUgXQ/ioQC/1F66YSI
	 mB9IYJkWQ9Lwuv3peTiDBspS2Yo8Eu8rYZvBx18PDLpwsaGCdYC/hLfDRBzd3kna8Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Wau2FUWXSJ8L0Yn3adOD+MyMibyJU3nSoKHXYa9IjQ4=;
	b=ypQKGJtBcxHiErgECCJVMEL87rzk5Iu4CfHy3kVX5EB89g05VhpYC+ODvTgoHNG19HNr
	 NTKS3kaEd/rSKP/0P8UDgy57ZAZtF0MXjXlpSFdXJsC+IuOVbgoV8RIsb6qgZauilWxwQ
	 ZtFiqHouhCX0VG7xEa1v2/KbAa3nLXNT6PQOC62xwQsYoXfQCET13No1IYcV8lPP5eeYq
	 N0xfLvY2iOSyQOgj6EA1b3iHfXIbof85ysYRvygMHDOMVWWxGWfojK5AfMbk7yW/ahKMY
	 nAPOEDrQ3Z+2o7nf3YW9A7xEVKx2MhhEtK8mHcWCQO1qgoNl2x8Mp3iLwNA6ReH0wJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R1uDtR2G;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177F9606A817
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 10:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 177F9606A817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R1uDtR2G
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso28326315e9.2
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 02:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793703003; x=1794307803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wau2FUWXSJ8L0Yn3adOD+MyMibyJU3nSoKHXYa9IjQ4=;
        b=R1uDtR2GjYitzFUJbzR/erukacxzIZ6UswgedUI1TL4nsNwtEivwIpbh/QgW3VoSVw
         h8NOB4q34uPndd0SoDUkXVh6n5svKbp1P01IgmwWyycjIilv3o68tL6arIAoFuUS4Lro
         j2Rubde310nQRRPjQOQpwwHzNADjt7rFh137pBRjZULnPOADmH82Y5mV/U7ACOUbr6WF
         ZlOFm728ne4gRk2gT40UPzRGIATbh8Dc4Naxpq0qlRYzGkThuC/9VzNGyFQmc66MO39O
         jeQ9qaMsO6rhRvtzLqHyNCXy+8oWyxMjGUm9vJZjV2oBSviONwmjnCObyZ1j2tCtIUzy
         xmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703003; x=1794307803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wau2FUWXSJ8L0Yn3adOD+MyMibyJU3nSoKHXYa9IjQ4=;
        b=lXZjfAaNoPfRhplwReLtBKPz35t8AuJJZ7SSOuiqooIRUrstIphe77Mn8eFEZB6ZWq
         VU2zu/v89P2Tu03yxte8AY4dSrWqS7HevffLNJnl6ATipCQ0ANHt7rSFF5IGVqji7jkv
         tI37hQE5edcYhzYO61Z8mgWrlyPiM125D683JNQCTrNlYE1feZhMGhFcgIiiVu/WXIxj
         OLyBo611b55DaSRrc56qsD2ZYVzW9SZYekRx/63wrO5JWvUT6WVcIQuF0UUd8eGpatNG
         mzJgJI3Y0SwkFOYDbURbW6Hp0pwoOgu+4l+SdNWMVKMDlOl1e1XJPV108sF6FHK5KlWW
         DMtw==
X-Forwarded-Encrypted: i=1; AKwUvBwtcPHq2W+UWAAsZNt6I2baGg7BPwBnoSUAGKeJc7YTn9Dvqy53AYnWyDrW23XTzUQo91sX07Ocw6hXXQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9JuuKB75OMvPoPVsLsVvBQFhqJq43QIEXRGmvRiDU+6EfrmFBZ
	RUUOOu6PCOWr0YG16aetmsHEoCpWJrCuNFYcJ1FmwhFpQzGW5SVr9+gY
X-Gm-Gg: AYBFou2869jkjVqfKLKwfGzxX0U7B8Rny29UNJzn01xmj1ja+HdVvj3ph1aaGNyYZX8
	yJ6i35KX2DG6MxMl/OXEYijUYcEuaUbNgQZofBsyxrpEjpeC2p9RT/rZqEz0B5kQ7mOUIReDpYa
	43YOrr6hooMSl9U0zwYgb6Dfc3Sg+QVVKTM2WvXL3AWCAWITrj3zPWYi6z8rvNsfCWgjTNxckr3
	AonPFCmLsH8x2qNYnp7JHQyU3pEEoMC1z0DifnFbBlAdFTHRf8gtjVfgWH1Tzd8rGPzZJdijy09
	lJA+hVgX+rYQvQaEItQS6UrFn4nivLUQv/jT+nDcm8eAGUlF5JyhfD/sl7ee8q6IOW+Tx5eixgL
	j53HQDdBA3RTclEwyMFqHlKlukS+Q3phoVdDYJtAMSzFeVttv2kxtPF8AZfJigCN+yHHMDA8F0b
	kk9FLx45ZkC/hJF4HZQJCLc5+0PBciU53o6zDKVNbrdqN4BMt2CR6+soDc+otH0qjrjPI1/ubDQ
	Vhqd5Ho9sl9Qzx2Xuv5XTdWqIdY8kpWQWWAaDJO0kvST8Zi+LWh1SBlXEs2tBS1UEDLnjeojAGG
	5BPm+8wHZx9LdG1h56aEh7KnEZrCDnNPEoVS+Sojwf0YyG2HIr+hbrljraGOLXdM
X-Received: by 2002:a05:600c:c4b8:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4ac150b38dbmr298757835e9.1.1793703003355;
        Tue, 03 Nov 2026 02:50:03 -0800 (PST)
Received: from raviolimobile.tail5f26fd.ts.net ([2a0c:5bc0:40:2e26:a33e:b98b:394:e242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm74970585e9.3.2026.11.03.02.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:50:02 -0800 (PST)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: i2c: vd55g1: Mark the AE lock and bias controls inactive in manual mode
Date: Tue,  3 Nov 2026 10:49:58 +0000
Message-ID: <20261103104959.52785-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <auh9SHrLKHTjENwY@kekkonen.localdomain>
References: <20261101195006.220657-1-fernandorimoli11@gmail.com> <20261101195006.220657-2-fernandorimoli11@gmail.com> <auh9SHrLKHTjENwY@kekkonen.localdomain>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

On Mon, Nov 02, 2026 at 02:08:40PM +0200, Sakari Ailus wrote:
> I don't think grabbing a control is a bug as such; it's normal that if
> exposure is set to auto, you can't access the manual exposure controls.

For that case the framework itself uses inactive rather than grabbed:
v4l2_ctrl_auto_cluster() sets V4L2_CTRL_FLAG_INACTIVE on the manual
controls while the cluster is in auto, and vd55g1 already uses it for
its exposure cluster. The AE lock and bias are the mirror image,
auto-only controls in manual mode, so this patch makes them follow the
same rule.

That also matches the flag descriptions in vidioc-queryctrl.rst: grabbed
is "temporarily unchangeable, for example because another application
took over control of the respective resource", inactive is "not
applicable to the current configuration".

vd56g3 has the same two __v4l2_ctrl_grab() calls. If this goes in, I can
send the same change for it.

Fernando
