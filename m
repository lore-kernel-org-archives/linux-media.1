Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.251.234.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278265;
	b=zMV0zOFIuCnwx5MMD7s1/pY4PC/bQ7bQZ1XmEGHOahgo2fpXzs0ETyOg7uszlv4hp0cu
	 cRBTC3U6mPBB9lLCNpN2JjwNnmfSRSprF5OUtAOQHZC7y+ddgKFfMn/944CnVHPZ4gbQl
	 RpKyjX6KWRZ5Hl3HT3CA2dcqMxZadILOBP7gO+YtfFzRZE6wKt+clc9q43XoZbiT/8gkQ
	 KsebHVMhxdR7OHadv8v1a2MrSBwGyfLAGDWXTQTwNmw3/tThLwDJQ+0sSIa7DHw4x7GrR
	 qGeUBv/eucwIcL37rPRTQE2CMbdR9gLlHXcaiQP9XmIXrj4uccFx3SwrosY34SmbFQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278265;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:In-Reply-To:References:
	 X-Mailer:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:
	 MIME-Version:Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=pDT+Kqey1NzfJtY4TrSB1jtxVUMrLURNDrx2AreClww=;
	b=wXVgd8UizZLyPcC19BpfRDgatjmA/klyAxTbw9KhM6mMX3WGfIy9mNXobahkNOOJdJZH
	 bwBlLDy46EVeBkCDQMY5U4jE/uYACCKlEk64U8Na521pJTd/LYMeecNn53MjqTB2UHDjp
	 b6CXLF4Fi+P0vsWKJVYsxXM89KG1ydAQA73y8RlhVEeQwOZTc4utb4Ba49FoKbkTw4r8f
	 HlKKKPqFg2bZ0kg+/UpGLWF5Rhh+ZOSFaF1qqMA2tscgFFxwoFN/q1TSubN26I15pUCzv
	 UNt9MwH8zoauKG9YvZqm/S4J3aR5rZLpQHoYwO1LCsR1gb4Jexc7FfVM+FrRbDuHTwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fqwqf.xyz;
	spf=pass smtp.mailfrom=send.fqwqf.xyz;
	dkim=pass header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=kGh5lS0r;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=IHAaeuKn;
	arc=none smtp.remote-ip=23.251.234.52
Received: from e234-52.smtp-out.ap-northeast-1.amazonses.com (e234-52.smtp-out.ap-northeast-1.amazonses.com [23.251.234.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6333B606A320;
	Sat, 21 Nov 2026 16:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6333B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=kGh5lS0r;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=IHAaeuKn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1795278265;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=pDT+Kqey1NzfJtY4TrSB1jtxVUMrLURNDrx2AreClww=;
	b=kGh5lS0rGhc1l+WXyw3TmGGzlLuoRAmSuvLXuDsdMWeOtp08aQQI/BIWofQTCupm
	JlhVc65zxzTKYIr1LZCQsRR8+Kcvrkrm11gw2+J7uksQhoThTbgkVlkMATwj/Xv4Ghj
	1Q9WTCSXFOVk7P1VhN3ZIBQW5o5kbbLXCfVVM+gk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1795278265;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=pDT+Kqey1NzfJtY4TrSB1jtxVUMrLURNDrx2AreClww=;
	b=IHAaeuKnPZjl9cmR/z80jSPllNsO6eMD4SbQO0EQ1GWRoVK9zKly913tHEh0X+dq
	+ALindb/z3+39KjDZpmIVq/9oWfvs57ua52xkSx8vhJF1BAAZkDbaNy+KYlEOuH4AWI
	TCIrbNKbFrTwsUe8washvcpYZ4BF6Emuf/SShnR4=
In-Reply-To: <20261111135338.27008-4-allan@fatecpompeia.edu.br>
References: <20261111135338.27008-4-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: allan@fatecpompeia.edu.br, xiaqinghuan@mail.ustc.edu.cn, 
	loic.poulain@oss.qualcomm.com
Cc: bryan.odonoghue@linaro.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 3/4] media: qcom: camss: always stop the pipeline in
 stop_streaming
Message-ID: <010601a1feec5989-7c15d602-3c45-4583-a9d4-9048573b37f0-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 16:24:24 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.11.21-23.251.234.52

Hi Allan, Qianhui, Loic,

This covers the normal stream-off case in my =
earlier follow-up [1].
Qianhui's shared helper also handles stream-start =
failure cleanup; it
needs to continue stopping later subdevices if an =
earlier stop fails.
My increment in [1] covers that path too and preserves =
the original
start error.

Could these be combined in Qianhui's next =
revision, retaining Allan's
stop-streaming fix? That should avoid two =
implementations of the same
cleanup loop.

[1] https://lore.kernel.=
org/all/010601a1b1b4c10a-5e87fd76-771d-44aa-9a2e-0755e5e1ff0f-000000@ap-nor=
theast-1.amazonses.com/

Thanks,
Jizhou
