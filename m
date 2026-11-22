Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378975;
	b=Pe3rkIMqnUyylQOIX2+5lLOltmCmpQzT3NdmHJufpiMkTMHqafsIEVPG+MRA6Oj7yPkr
	 MCHOLvGe7Uf/BeKpdykJr+mVI8gFaFrYzwbsR35chRjaW6r4C4p2+1wF3RSagt4k+oXwl
	 dd2tSeYKzIx6aZXDmANYGNgcdFswqlHKPXjeltBISt0hyJOnOmdrb6VDvNDtYjQYqG55p
	 w0oD8lRIxIC1aeV8FYciDc0ImF3GcAbOXbcS3WvW6cmDI7s2vjl6ha6PPUDRr7CjKBSnx
	 o97hVJkjF+mIprxhv6ZVLOQ6Cvhcat+mqO5PcZXi/0MXQZCbsWRv/2wT5VyzLRKNVZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GpVBtG1ZIUyisjsqs/xpaJk7qYT698fGtTK5Z6O2ZiU=;
	b=gBpN0AwGhBaYzQkh/fojvIKpegunvPueQh+kQvoceXCUV4Vc9IOXyiNCP7p71yKTZwLA
	 AvQ7HsG7QRHsSf5Kb6RXoOYnPmtCVSbbpn+Cq8oSsEMI92LGY6IrY0MOg3Ul9D6Fzy8Xa
	 3h2fJsthrXwI0rkhB/aydjhg9j72JdnfR1wvTEkRB5I093M5AfHpFI+qterz7M2Wh7KEd
	 rxaku69MRwkIGn1yX7eE2SMWo/fyyPEOS2LoFWePtubUUDeG6FdSOJKtTWLl2+l7yx90o
	 mCPkwL3RFrPMQvex5xp7lK4FMBGJxm2rbcvQ74szPNaszHOErepryIDfble99oaP77A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9g6nOee;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AFD606A31D
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 20:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4AFD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j9g6nOee
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f20b304c0so263635085a.3
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 12:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378973; x=1795983773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GpVBtG1ZIUyisjsqs/xpaJk7qYT698fGtTK5Z6O2ZiU=;
        b=j9g6nOee4xezCjykCdJTlzqCGnpYKG/HoVttPGr1dg4aCHpyOUV7W1OVDSGRh0r5gw
         ZU5CfTmL+ndhBW/H4RINENI/1vb9S8wkgvI7Ut5Vm/4cTjxk9qWnp3XjyVQCIp6MrA1j
         Rd1hSAdlM27lKOgBqL5h7J++AY7M7az+62ECtjI6mFsAIotKIuwoida4E139/MIvFIu7
         Q3DL+4UD2FKzFuGRiAJ6Vv//VxJNxZLjjHkiC/+ALheXM0odNZS4v8LXh10yiRLWKe0O
         sq0cIw9g6LbZeLG8Wmw/d8UYmSICUrH8STZopRZZeBw/OgjH9Z+yJHrEL11BybPpbAHH
         yGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378973; x=1795983773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GpVBtG1ZIUyisjsqs/xpaJk7qYT698fGtTK5Z6O2ZiU=;
        b=VcGghwjLCewHdvj+CJ7clY9dFpdWSwR/1bpAX9dVmM5v3+vua8lXOL6wqP42lQsScd
         2BusXzyrl/7kzv7LzK1YhgDhs6rzFDzUzt0rovFxsGgEw4MfD6E6pvtFby+b+JmonJqr
         Ezi+SYZOwywRRy7uifyS7bW+BIz35dwZAdUm/xw24a3uANcKp2kCcNv7YBSWLcKJ7qlU
         TVMxoVB7BN7ftSbwQjaE2YFoCd8LErFuoit+fgXOA75GjNxluSGktvPRWPBT+zjkAoJL
         YcpNx0hEsSs5jeuV1N2r3d+d9Nc1E2GyXgmQGv27Z9YX4Swz2ZOThhB+kZ0p59uJjgw6
         027Q==
X-Forwarded-Encrypted: i=1; AL+hErHIBBi2yzrB8xQa0QwTqd41wFHZQkeNVQMRpGrMzMVucMUBCFBOaixqzWnvDv+IkJ3qwUGj4L6EIcCQSA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+cROONtRtIKF9jviHhJTpFYVFD9JMyfLPi9yvhQAsqBYAEnW18
	8E9oKpROhMKNkoWMVbLcEIuSYBMGo5lZU6nYJ1aU0DHSjuKA+nocrRvv
X-Gm-Gg: AZFdTZeGMzYuoZ37rXTvm3P0O+CX/Rwea1PrwaNKpn2a/qPjjg0RndO4L2uxE2oo8uv
	QBXjlmbwQZovbsyz5Mo5lXfP9vldkZJRMn357BH1mdADGfCoOSPwgKNVSE3uGjec5j9AP9JbkGO
	ZK8VpY2k8uchV6vdWuUXUMojdZz8XrShHiqBcJ7KfbmZLfhKwjldXgs4TJioBJPBqYTpm5zibBI
	G8On+YNXlC7NgseiPYB1VcppwETyhuefGIhg7J8a7ewi2knGuBwSnjVV0i02adq4cb8ybfYLCBZ
	BiGPNJby8pXTjX8P7vtDSKGeKTdAeggxX0OVXoQnkA0zuBhV/62RqJk6CdV+M4Jxn/8C7RZyiFo
	F02NQG4nJN0ekcPMiJNTzFa6vVPkURPxJ/m148JdKR/1p5qmxmQBcfs4uUFS+lI5G6epj69BE4I
	G/bAhPWy71e4JQvPXr18mcZs9KdZtgWlPbdfroCuNCnbDGYi1quSQDdV0lFTWBMRAq+1sKMVnEq
	r8sOJ8IsKu3HdQV+6wugQadviZcBPd8ecfI2f6e9uSCpP6l4TwUGcXrSqGLcmZ420g69k9Yw3rh
	3PGePXE6aD2lFin6pu4SDchcn9WSj7YtSYiV1udO+7DmiJrwORtQoECH5qVkOuGVxi8pRhOoBoj
	N8f/OEMP7ptnojoRmoREEbb4ee3NmtMZG2xuHolGJc+2dKWN6P0N0l0E48jFi40fLKIHH3xzZ+y
	1+f1UXZCCgbbhVwmZ6MRMtQl4UxsQGtU/g/t5IflkzNnIt0hCzxgzsAWFJLGbcMHVnbOBvxdDA5
	cF5CPuC4pJgaJ7QM2o3oQ9S3ITEcw2HDQPi0gr5Oa5Fj4ZN1yjcC2VdiYZ2nZ4xrQ==
X-Received: by 2002:a05:620a:8395:b0:947:ae4a:ba48 with SMTP id af79cd13be357-949baa0af75mr1570766285a.56.1795378973537;
        Sun, 22 Nov 2026 12:22:53 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:3c7e:3a8a:889f:c3d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b6bsm85114916d6.1.2026.11.22.12.22.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 12:22:53 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Allan Siriani <allan@fatecpompeia.edu.br>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] media: qcom: camss: Map each CSID to the VFE it feeds
Date: Sun, 22 Nov 2026 15:22:52 -0500
Message-ID: <20261122202252.58090-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <bdc56ab4-bdfc-4fca-90e9-d062492d5bb4@kernel.org>
References: <cover.1795196107.git.jesse.casco@gmail.com> <9e5bee0dbc1c116672ba0020013ef0a346385c29.1795196107.git.jesse.casco@gmail.com> <bdc56ab4-bdfc-4fca-90e9-d062492d5bb4@kernel.org>
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

On Sun, Nov 22, 2026 at 02:14:17AM +0000, Bryan O'Donoghue wrote:
> I'll take patch #1 from your series and skip this one. Dropping CSID2 is
> IMO the correct path.

Hi Bryan and Gjorgji,

Sounds good, thanks for taking 1/2. I'll drop 2/2.

Jesse
