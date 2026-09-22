Received: from mail-ej2-f31.google.com (mail-ej2-f31.google.com [74.125.228.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0184F93B1
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 20:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790110326; cv=none; b=hvbY+iIULkcWTXxKyx02Tr6aSumJepgFbQK44tAEDxxcyBRMpzsSOQLb/7WMmLQkwnidX+7yW1Aj0t5OjjGNitVV4kPEjFVwrUFrTinOGynXTgftJqbQ7lnbPjBSvOgq6NPOune2b0E/BQM8OcTSfXuUfLHNh1gBxXcJyYUJoAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790110326; c=relaxed/simple;
	bh=3h7mHOameIoi2QgF0fHWnYb2LmLJUJCfP/tMiTq5a6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FEEEorYnSOzyH3jTnJclHDUPRZv6u1U7rsifmQbFOacuAjjvNYDexluFVmpuGnw1PmllCiBSjfl1TMEfGCnokb5aP8oF/nD6pTpcj4EGO/o2iG5VJwVbe2XuTmSXXtncVx/7BpncOkHvNxWQyj8rE/1714kNxg2cysLLDHYxQ0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c0E/YnmX; arc=none smtp.client-ip=74.125.228.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c0E/YnmX"
Received: by mail-ej2-f31.google.com with SMTP id a640c23a62f3a-c29703cb796so31097466b.2
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 13:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790110310; x=1790715110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KHGFgcODsPMbkSrmYbc3O6srVnG6fm23/lscBsfkk7o=;
        b=c0E/YnmXDXnA0W3TY21R/IkeyKdJM2PpgPM/9UWIoPip44XcT37DiRU56ajGfXQreh
         XbtA98MmU003IP6aVE4vo0e7CFyewR+OJ6jlfYpHYkyBd6EtaQIYyWn1hiueZsvbu0M8
         EXoMuH1p32WWhWL+KxL+ztT3EUV77T8v6fUfmRpjNfhwRjryLLsNB8U3ACckWJayzkCn
         tu6km0rP8tjoDF9kCDSbh8AReDVGATgSGvziAE5cjurIpws64KF6b9ezV0Br8sB8esxO
         TsLzrDM8RVugeqCt3GH3kPPLaFoCYbRrHtgMGl+cdl526gxQp0Gr8XJXS59TD1pgFWW3
         Viww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790110310; x=1790715110;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KHGFgcODsPMbkSrmYbc3O6srVnG6fm23/lscBsfkk7o=;
        b=hfuunaUOzGQ9eXp/uZvcUnvldOtkM8W4bSMN6KOkaLdgibRJIBMVAPaxlUyx8JKfnQ
         znGEc9v5GXoQ1QEmHlJCsIqFzLLhloJn2ceEZJXlJWLta+23TfLkdveYwKTZeWKpjdbX
         90aq0G6ZVBrSkQT+IdOnuVlRtK//P6QFPFnlMhqmSwikUZyCBuw8/D5mCBQTA2R4iHVj
         TXxLOBlyOWRx20u7pvOwpr9lxV+LbbI1p0vqCZDwMkkamQXpEAoIZo5qjKbK3Hg2m1FV
         BESL/Rx0rXtuKLhnz7o+WbUKYUfmAiuiMU2hEpnyEyALTbDQzxb246e0pGzSM3bkZyhA
         Tmag==
X-Gm-Message-State: AFuF++mLiOhfwK6+cRgD/OpxnVRMif3H1nwTModcuK4pHFuMgwqd6hzM
	uI9ixuattzCXpcPCxYNwY4FThzdUVfxn3BmTzW3+pfkjmkA1Hvju7aSiwYoSS4Uj1xg=
X-Gm-Gg: AYBFou3UyGr1O5dJ2Tp3Kv1yhD1mlQmtjxsFt5sKxq4UxKNmvwLC8QZdse62jXtWYxd
	xw/KvI0ZTVYZkQ9S1s3Ti9/zKDvisaTn+la6Zmf5+iacRqBN7P2GDcPahWnLVyeeI/uMhRLo+dF
	ZkDvjiCmtb2Hu9zAVUtAuFwq7hu+TSIfFcgRrT9HmBcmQKzU1b4wsYZwqHoKxg9Vc6wX7sy2bWw
	O/Fj1ZeD9FldyRQy6xmjrSaHetokyQ3eSNb/2Y918ZKFIHVaIptPCELlYN283BpQvXC15ABVlxv
	frj3R1ByxcSaEpxxhCk1e9ALXkIq13c2rRWprAWsGhGMgbVVssa81iSQrO7yTOEktC/RT54eo1A
	GmTlF6rnNnYL5fiSNCM4BFGmjEwYMKziMjOZER9eFsnUbYlsWrQLCUiw7+mM+6wUp9VYacadghi
	sS1K/vd19MlxoQX0jTzBSGbVe2coyHGD9MI8kAfIZqCPPbd8gSyehrVhMuI9spj+FP6pNqtse61
	PbyH2UN/0QM
X-Received: by 2002:a17:906:7309:b0:c26:227f:5f7 with SMTP id a640c23a62f3a-c2aae1202f3mr32384666b.46.1790110310034;
        Tue, 22 Sep 2026 13:51:50 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.71.182])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae61aa6bsm12294566b.30.2026.09.22.13.51.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 13:51:49 -0700 (PDT)
Message-ID: <1eb43e3c-268e-43a0-8eb5-b3671bc85a8a@linaro.org>
Date: Tue, 22 Sep 2026 21:51:48 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: fix VPSS line buffer width and height order
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <xj8gcJD42EUlaYqevxWqTohqhMOfEkOw9HpA3v6Sz5tHhGNi-JzG49H7eV8bKDlC5PhXlgSllU9Vho0Ht-GW9w==@protonmail.internalid>
 <20260922-vpu4x_buffer_fix-v1-1-d1b6f1c24285@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260922-vpu4x_buffer_fix-v1-1-d1b6f1c24285@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/09/2026 04:24, Wangao Wang wrote:
> Fixes: df816dce1b01 ("media: iris: Introduce buffer size calculations for vpu4")
> 
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>

For future reference

Drop the \n between the fixes and the Signed off
Add Cc: stable@vger.kernel.org

Please

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
