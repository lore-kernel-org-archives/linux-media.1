Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918371;
	b=TwBDh8mwAocPESONRAvLQQThW0qyWCi2tBJoMpJWP6QspBqe9+oVkBTVLW7dFi+I4PfV
	 UX19eSb1pNGqas1+qHurzlIW+8g++FHUvIeN6yF19rkPuBwqx/E5DBWQw6IRY+iQL/miv
	 yA6QfsZIvKEF3eiOy9GuvH+Bh61PTOtNV0iiTOspfXgs+eI+dJMuiiEkKMdeprbGYTPkY
	 sGzIaPDUXhm6o10ZMTfpC8NcwEAfHsPPXKcnaxg98BouHDKnSabyNL88AlsEfRdkv2RRf
	 vCzg7Bi6RMX5DiiOFx0SIiFGk73VODPAArYS612FnDIhxXZM2hwXoKPmvHIlmvx6zYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:To:Cc:From:Subject:
	 Content-Type:Content-Transfer-Encoding;
	bh=KMI1L7ZFWPAFw8IW/VtytLfu4XaI4UCuNHMGrlaZyxA=;
	b=IGG4CJnxTz/9x5TFOaD+foLy43hJbxY5FTxYQu9ge9QRuj+bWztMlQH1STQSmvPkq4yK
	 gxFAhg2+qb6pnJW5ODiSrrzDKO2UIWg8J0rAbMOGtNyEAp/tKy8N6h3t5f7PzZu82QoqM
	 gsmvuI5mZnBUA819CgdyAU7pH9MO2Jfdy5nME88HMDZJb3028G8dqK50Bb45NYc3vnIZk
	 1fx3l64KEly0H3192jCGTBVVvjBUpQ8btlb9kw05N7hAdwmduvI75ECwxH/CBNAMgGLR/
	 B35govRwtsrrY9Qbqgo/6PDeYmPwvcFqtYZauIvAUCuGri+mOX5X02atMO5Rn1pzk0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="M/r6CiaC";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6AF606A31C
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 12:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B6AF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=M/r6CiaC
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2224589f8f.2
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 04:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794918369; x=1795523169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KMI1L7ZFWPAFw8IW/VtytLfu4XaI4UCuNHMGrlaZyxA=;
        b=M/r6CiaC4cKU1nipkCJmBuj36hgbHeVqyQPVK+fsHBcT288jKhfMBnuq90a4eScPlI
         U2T5Ni0ZSKakIzOMJ/w0girz+EYR8IX8zhqEHn7o4MA0zVMnbM/oNSBDo3jaNwDn+/a8
         VsSrsdA1hwFKFpDWU72Bay/0JFUQGFVEkFteQT/DDEVy8A43G2q5e1s1G9WgGsfLSGeK
         ewc2vbuDhmPsSE80ZKERmCwwsJcTaNUnCUfioN5bfnxd3ecXL280CDF7Jcu1csEDy1Sh
         klXPALmKhoyndGmK+rE3Nf9DwQM8oJJriDBaTwi+LQJawgtN+ru/DgGRepUmOmWSieta
         VTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794918369; x=1795523169;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KMI1L7ZFWPAFw8IW/VtytLfu4XaI4UCuNHMGrlaZyxA=;
        b=Qm6rz+FrfatgMfksZ/2AqXFjA4SDW4ZCHfoPV3rUtrTMBIFvO8XprkDh1kPN2akjGj
         Rtrxz0B8kx+/X5Eq2T5R7sUfK3UjfV03M7vSY0ISxxKy4sp3tQZrYuRbtNtjC+DXyOpw
         KtPz2cLjOd3WX7ZIFtJum86ltGezF7a3UGryYZMGZHAqLG6ubIE/tigRptJQL1PWSBWh
         REDnpIcRLJtE1b2Zyy7TKQcw8xcQfebk4BpfCnJhfyCGuyWNVCxjLEupsE1oe0Rli/s+
         1jSp3TvEcnH8PHftqS8EIU1UAT/h5cjBZt6nY6T5AzZc767U3Iw6BXSU8aTriBhOs+9f
         jjVA==
X-Gm-Message-State: APuU4Z+AQ+Fa9AwaIGYr+p3CQMCA0HB9uGAjknTSYWNCFPtksvQeIxwD
	ksiUse+eeT8LZ09HHijWF3sHwcvntRWVtedXElHUg2hWgvUFTzV6R3tBks1hcys4Zn0=
X-Gm-Gg: AZFdTZfdv5kjVQ1XB4Roup7hQK72C+5d8UA1hex0QqkoEugBrUPKqLlDUB1m9Xlrj0e
	8QIVjhrcy2Ksj8tzd3xmGlR1AjU3/OQ9fvchRnwY+QV7Uk6x300XqXrLXk49pxtmOpoRX+m6UM5
	ccSxTvSdF5Fp+eWIkpOXYO3dGqFbXTPXvWT7uhf2LKkTJMGQKzv1SwqSI6Icg/hWcBSy6XEeZ5h
	d5nVCsa1O0oy7q1UoFb98tjNpJPIxpwdhps+JpZp5xs+B1rQjIBuTswkifCRjzfJ8PzqkkmtdeH
	H1UQxaV582AAdZCFLmVcAx2VxVE7n75fIFHu6LqcOdTKNxNQa72y/4px2FokNE5Hx8yVSIXWXdz
	BrtmDy0zZCMYphuIJXCEdTK7Oe6lSscNKkTfdfIRH2M6wkxSU+7kPmjF8OcH8a9t7KF2bczNW7T
	uO6Kj/VTqd5Pv9Ayz7KgWQWkIJrGqmgxBdQezSlRVvFZ85aHpUCOQqSk9bprBHv0PfGWM7VI8aP
	uougLP/VWYV/o8tsxmkeSOFO2qrS4W7KWOc9pPd/OZmo4RgfApF3Pw9YN4A0EFgSVuREgctAUZJ
	MciQRkdB+8rGoEp8h/HCdjmDWqk2ImBbcBMemgwluh+1AoXg6lgPuWp22+qLqN258tfujQ==
X-Received: by 2002:a05:6000:3112:b0:4a5:a777:b5df with SMTP id ffacd0b85a97d-4a5a777b6femr215065f8f.0.1794918368661;
        Tue, 17 Nov 2026 04:26:08 -0800 (PST)
Received: from ?IPV6:2001:a61:13c9:3501:298:837a:bfe8:6c62? ([2001:a61:13c9:3501:298:837a:bfe8:6c62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7390fe82sm29315977f8f.17.2026.11.17.04.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:26:08 -0800 (PST)
Message-ID: <b3dfdcf3-2212-4151-98cf-a3d96f494f50@suse.com>
Date: Tue, 17 Nov 2026 13:26:07 +0100
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, Takashi Iwai <tiwai@suse.de>
From: Oliver Neukum <oneukum@suse.com>
Subject: question on 1faf84ff1c0 ("media: ipu6: optimize the IPU6 MMU
 unmapping flow") handling mmu_info->dummy_l2_pteval
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

before that commit the whole function was aborted, if dummy_l2_pteval
was encountered. The updated version skips a step in the loop,
that is it increments l1_idx but not iova. Why is this safe?

The old behavior was more drastic, but it looks saner.

	Regards
		Oliver



