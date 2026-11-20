Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196496;
	b=3ICnR6/aJnyOvKlCwKROVe/Zj2LMs2wPCh77ZVcHmmr114cztSouInoGbvfRPb94sakh
	 FsiavfCvD3L7hOonKmx4/uvKtP2rZZK8xQZhWXpDCS6XwDmYrhnDMHFaBDOPGzmneX3c/
	 luSfa+2ajd1zhysBDTJ1XV+wnXcHH0JR058htzUXvvRcWX7RiRQoiQgrqykaEM1VvmVpE
	 YfauYw6Z4HVqxuXz696b33iOlKQENiY5+CieQA7zEQHl4L1HKQTBJrZKbqzFemqK175xk
	 gmaC95XQvvF6uZUXcv4rmp732vKYLYR2CoSFWDvnS9eV/i4605WEhTBWsYuDJP2ZCCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kxLtuj83lfG0UYc5BBkeZk5kw3MAE+EKpdjGnuY48iI=;
	b=gia+KIc08Hns/GzaJIWk2W7zzvSohTIR4NycY2+XmQxd9kMHrOl+HlGzJ6CeXjIAVmVE
	 VYt9VOckUzIAwjjCMe9wTkv5jzZxUc6jrlrA7ma2vRsGhM8VfeQm0sJaqmRjRc2QXUJYA
	 2HOISa+zqdrtBLBo8X8Nm/EJa72SrsLYbmUeS8xdHyW6FIrLRs1SZR2aXrHhIOrj/V/8q
	 fepLF/VQKfY1b+iaCi4syY1LfMnYVKKobTHsbfx2Thf28Mo9bDxEiyrPqiWbt/Kd7fi5V
	 +AXtqh/9DBzw0itulRD7tc3gdfU8qsg5UgrHL+tC8ukTeZOvrefsFHAZ7WPj9woF6Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qm+ZhYHa;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25505606C2CC
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 17:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25505606C2CC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qm+ZhYHa
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53639b8903bso14430401cf.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 09:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196495; x=1795801295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kxLtuj83lfG0UYc5BBkeZk5kw3MAE+EKpdjGnuY48iI=;
        b=Qm+ZhYHapp0szXH0S9zpMcxW2RbSLzz/OXz8NgulXgjUAAU3zlsOZ8WcooTzuzcoS9
         mPnY90KqFKEVfGLvOQNWb0WuOgGyO6J12rXw7ZXm0lGz+eyZxho1Z3Ej3GMYPhZ8bjJh
         k3hGq+wm1nyFGRCF3JPvhLY3P1IY8RoEwSNMqm9r1VhKfu9nQitGEVsYEs3kPyM4ec87
         OyOmBpkNkHcbVev4cZW/PK3w1R+OIH4QiU3jxh7vz/g413B+JAxcKTb5dtOg/THB4vym
         7Krlf7FkrflWQ5nFH8zmA3iwX94e+LuD9vD4pA4vguHCHlXSjaJH927n7y69N5jJBdGZ
         0Zeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196495; x=1795801295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kxLtuj83lfG0UYc5BBkeZk5kw3MAE+EKpdjGnuY48iI=;
        b=UNfb7DzdeWq1cM8WFogS8wAAzkcISQ9eHavz4HHrBXYJpFE7vGks2pIRmBk9QM17zt
         G5CT09qxK4xQ5DSpzaAPzBKFOVTcx3uzYWSp0KgT+Jm7iqV5TQ3j8I9vrUIRBO8TfA5z
         O3tGdIOUWDdi/sdVoDp5+lBVWeP7n6c7JaxCFQbdrO4bd/7Ne/ClwjSNHzF/0BbI38jH
         IdMzZF8U8BAr8gelhFrBQ97sTLBru03tWqd0JDid9buneF2v9c9sZ7XK6cuM4gi+F4Rf
         i+l2t8Xkjwuty3q+8rugYYr6Bsac0zTFWRQn+Flke8P++4lgoY1zJeLHiYxzZMe2Cg5d
         PDVQ==
X-Forwarded-Encrypted: i=1; AL+hErEJRprYy3993wNOYd1sLg46pQWezoT7vSjVbSLXSss3/xNOwC7IArcFvgycSbQf6fjj7GWVqqvZ6Mq1GA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8dADmwCyAtud71VczDrxJdDTLJ/tiBRGU+dUM7zaTLuAGS9+gG
	yV07BtWJrU7yqeIvyDrnobfEWakyeEhhrM5WGI8/CL7af/8gmvulurxf
X-Gm-Gg: AYBFou1TjS+iQukUawqy4ylrxn4ThOEyelahW/LOeYGMdHjCkNwOV31rGUX5EFma5Y8
	QPVaVyCbn5n3glYxaLdegyeoyqsyEIi1Uke8RTWyVfV733bNKEwOE58otiYTQ3H9HpRgiW8iRYg
	YIN6vdbN986YbT0sIK+LKKpcTl5qZt/KvGuu7em+b+h6CWXsxWb3V/upmJoTrUCUbJIv8LyloZq
	NHebtNr2SZEQRpULachV+1gXROClGT3xP6ZLxFVT8RjgzbAOTTG8ANtcDHUoFxHq9Msw+Esnp4O
	GNH4CHMJKBsES+76W535vbI4OZWjfZPgsBDv0nHtBlnFh3K8meK6LyE3ucWkeAxOxWCFlSOa3Kq
	o7uc3RnXhgs6wh8wawXTj7ktAHn2BhVTgXQ96Or+hjWxepJdp0C3r/TUcJA7Q/IufIb0Qr+I4jg
	eglkvUrKekbL/rTU/vt6HcJuf6kYzwf+KQTVVd//CE2D4gL9h8jGJhNZeyTxjK57AjjN0m3guju
	FK6nqAnfNFIG8wTsVwf0r+ESLGfinvG2WxgKGxbVS4NlXPjcl/ZgfPfr5alC3m/7QgbO0Sitf5G
	0xQky2wISD1K93IWKjctxxwZNX+5Up4Dr2I5ij4JOkiogBDwy9tPzmEEZ8EReO37RpADqtkdYJ+
	GhhEqylGWmxbqjzR2siKvoTVfGZ94TrZ7EWDPNCapxVRSnPqey41LzWY5r3OyoC3UV2r7hC0ygg
	nYMhIMWZXy2NekwyzN61RicoqycfjSvymDe5Nr4Z4LKQ30BlwCpI4dlacPJav1iA0oCKbixEn1U
	Ios9KTAWNitiA8I3BowdRU12Is8yybjckfXgiNIbsFaOw==
X-Received: by 2002:a05:622a:420b:b0:536:6c22:e340 with SMTP id d75a77b69052e-55d6fcfd016mr85938901cf.23.1795196494927;
        Fri, 20 Nov 2026 09:41:34 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:d420:4621:169f:8773])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349e602asm31538556d6.24.2026.11.20.09.41.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:41:34 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Add Glymur-specific resources
Date: Fri, 20 Nov 2026 12:41:33 -0500
Message-ID: <20261120174133.62863-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com> <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
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

On Thu, Nov 19, 2026, Nihal Kumar Gupta wrote:
> Add Glymur-specific CSIPHY resources so ports 0, 1 and 2 map to hardware
> PHY ids 0, 1 and 4. The remaining CAMSS resources continue to reuse the
> X1E80100 CAMSS resources.

Hi Nihal,

I tested this on an Asus Zenbook A16, with the series backported to 7.3
and the board's CSIPHY4 link moved to port@2. The OV02C10 on CSIPHY4 and
the HM1092 on CSIPHY0 both stream, through media-ctl and libcamera.

Tested-by: Jesse Casco <jesse.casco@gmail.com> # Asus Zenbook A16

One thing to be aware of with the reused CSID/VFE tables: on their own,
only CSID0 -> VFE0 and CSID1 -> VFE1 stream on Glymur. The lite CSIDs
get the full CSID clocks, and CAMSS assumes CSID n feeds VFE n, which
doesn't hold with three full CSIDs and two full VFEs. Both come from the
X1E80100 tables, so they're not something for this patch; I've sent
fixes here:

  https://lore.kernel.org/r/cover.1795196107.git.jesse.casco@gmail.com

I tested this patch together with those, and with them all four
CSID/VFE pairs stream as well.

Jesse
