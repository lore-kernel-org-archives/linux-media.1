Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C086B50B404
	for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 16:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166943; cv=none; b=RCGEwx04OVDcLFTn2YMaYJ17jW6d4VhmMAt/lMiWdxXLbQ6F6h1yIX46gK7Ucc/aewq/d8KN4yif92f0adE5jZpnBrD9FDx8U2utMqyDqgUoyJ66+loAhGEp2cFDHLndzo1LFvOivZJBT9oyxRtaM+GOC+hR1gSMwYYV6ujFmxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166943; c=relaxed/simple;
	bh=szFBXro/rSTYjHAQMGTLHw3nMlQZ07NIOfznFY0g0DU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M81Qkd4cGEx4pVzobYW4LWP9czsKhNY4gr8UTJGY4T/ruZVIHEZgIGu1Vo2HVetSctoOPLL0+kW+9JsQfBOd3gwPbsFM5KYWbTAAEJ/Wi6U8uiH3TDldSDPaTUbfFMQ2VaSGNg82eP5f8kXQIHd5B4A0bzcAw0wxML6Mm2rNUTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rQ6ck7tF; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQ6ck7tF"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1af482519so1382195e9.1
        for <linux-media@vger.kernel.org>; Fri, 16 Oct 2026 09:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792166940; x=1792771740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ttmMFkFYZs1qc4FswsXiJbWUTRZVrDxwrIXbqrFBdtA=;
        b=rQ6ck7tFRCG3pt0ihngKB1LKx1QMCaQSwMi8mZerNB2iLRCiXLinqLgpkK7jx1C/5E
         CQL+zBj/Ejh/sznP2RmZqyuWSLrWcrMWhsp5cT+SYM8y7RsY0Kbwg7Z7/Y6sae0Bvmjv
         f2qTZnwsx0W+ZYTThDNffXVO6d4KT1MzOYKMfRzK9xJYYnnCbLclALkQzSv8WiVtCpyh
         0UE24mdWcF4OsBfEAYVrTqSmEDVdIPGD7+TFx8YPlx/ew5n/GCQa3wkkiZfyo+Y14USZ
         5hSGDeQwk72UMp8uF2tEbvKq5Nj0Q9MVzFTdnWSUP/hXE37fEMkmpX4nPE1Q3i94h+bn
         Lbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166940; x=1792771740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ttmMFkFYZs1qc4FswsXiJbWUTRZVrDxwrIXbqrFBdtA=;
        b=bOwaltOQIwOfqvv129f3COhQ/13x/B8gLgCdpJq8NfapCK3MnqbTMGocGfKYcP1Hxn
         E7lLu4KJLqBBunlcrUuK+9Qq17nvBWyScFF6FB2Qlgg5ML4HquwRB7kxpiZT+bJEkP7M
         z5eW6c41qyxt92wenCq4HzdkOdtur8D9YvxyTqbpKeb4M9oa1yswbiNi/+GiDaMZxjfC
         48sbZhqT0kZB+jqan211NbrWpx9CBXh5H9XgUrO/+iovaL316HyMQqnFGUXjlZxt+Phy
         HRaSObvn5CzeRLbF1ZinWS3//tZHdW3MFfmKsvIs08RREi/YmUHK7TctpV56ljeb2WTa
         bTfg==
X-Forwarded-Encrypted: i=1; AKwUvByyu5slDwPbW5zMe7hnda2KkfPDP1phdf77RJHKf8Uil3hceAtqjfq2n21azi8ROlyZAx9JyW9eZNkDkw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJbblVtdF9Y3MJri+2bf+OeVoX03RnEaaAJSYy75YA/BmDSwcx0
	lAqvUtOxH05Bwjpiw69vrSTONiwyf9OpcuM0GOpT6Xd/AQ3TFR2xAgY7
X-Gm-Gg: AYBFou3ccuLXbVXjSV0HRFFYPcY7OW4H0A9LU7kZDDbRSUbPqdO+4qEUHLypugsJXln
	YGunasuGxAhTxNSBjV95czgT9DVhUpXG4VvCVgcUSt/JpOkse15AyrZL0mRzctbOAE1oeO5K0Ir
	KGqIBtDZVkGFOFcUJYSl0NU/h8nwSEIb6xKhMmIcOHzeO6uyvtfDwyl/N/fewEUKDuNQW0F7Fq3
	JnJrAfZaZ8WcBrVbktnh0fZaJHVxIQNv2BUPvZe6hKXgkJXx/MuC9cV2PvRB4NpM8jLa1hgPvza
	0U+QivSaRZlVOtPbuYetF+3GKySqXejmnK/Fb/u2YIwksVmAESwiC7wtxRzCuZ90Q3Pb8IQteUU
	Vc0SxkZMY+yKmb/+xz1EPDm/PqQsl+KbZTDTcJWojHRKBHs9VxP+HpFGP5Uh9yAV1FtnW3+ccFF
	yBvRwJZvN4/Ftv3ZVRQX1DE2eJTVj8ZX2Wpxdrc7uOZPmElWjH8AcW8PwDKQDSjnmC990xNLdO3
	zSq8QHDGyNp2RISixy4Q2yPpdReJjAVudDJ8E9Y6d2BIKerELDHTq1LGdwOc7aYyaMa5wN8
X-Received: by 2002:a05:600c:e548:10b0:4a1:d766:758 with SMTP id 5b1f17b1804b1-4a1d76607d5mr3809095e9.16.1792166939897;
        Fri, 16 Oct 2026 09:08:59 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd47104csm6779011f8f.8.2026.10.16.09.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:08:59 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	tjose@qti.qualcomm.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] phy: qcom-mipi-csi2: Add C-PHY support for X1E80100
Date: Fri, 16 Oct 2026 17:08:58 +0100
Message-ID: <20261016160858.193572-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6564f9f8-6ecd-4912-b029-c92dfba792c1@ixit.cz>
References: <20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com> <20261016-x1e-cphy-rfc-v3-6-40a346a72153@gmail.com> <6564f9f8-6ecd-4912-b029-c92dfba792c1@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi David,

On 16/10/2026 16:10, David Heidelberg wrote:
>> +	{.reg_addr = CSIPHY_LN_CTRLn(1, 26), .reg_data = 0xf1, .param_type = CSIPHY_DEFAULT_PARAMS},
>
> Thank you for the change. While the lane being decimal number is completely
> fine, I believe the register passed should stay in hex :)

Agreed. In the next version the macro will take the register offset
within the lane in hex, e.g. CSIPHY_LN_REG(1, 0x68), so each entry
reads like the downstream header. The object code stays the same.

Thanks,
George
