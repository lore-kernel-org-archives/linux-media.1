Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC15314D06
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 18:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774117428; cv=none; b=pL7u9xLYCyCR9iy568ojCL34m7zC2M1QDgV2UCCssYOvi3a4mYv8IA9aWUbPMzqjrAOT5Qja6j2oTgo3SCXWob8Eqa8X+Bqf0zIcpzUuQYbKx8Yyc83OGaaun1lAibuqjRNq9X9oh1K7VMTXt5dsyxJnyNWDFjLdrJ0l1WpM0Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774117428; c=relaxed/simple;
	bh=M45HBzZi/DPHhiEVVmFrD3PNcMJmCosyRbAWgQNCU4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PVHM4ISzVgXGfCfcwJ45H6KK+J73l6sw/XvCiTNhJ48JGitih/j4Dz0XEcNVl58fzJtH91DxXtYSA2Io+GWQBeZPWZ2xPdhAlOM32/86xNoDRP78DcL3x+8NpJcV2D7hq2HanQnuH5wxTf+BOEDJa5z7yABiJsM51Lh51xrLzvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sqq+fKa+; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sqq+fKa+"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-829b8b6c4d0so2495822b3a.0
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 11:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774117427; x=1774722227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M45HBzZi/DPHhiEVVmFrD3PNcMJmCosyRbAWgQNCU4U=;
        b=Sqq+fKa++/4uTs2eayJJ1/HCfr7UWSMuZAexJUKhSBqGYXtF6yvCd8FOeAHSPiKwFS
         QIFLAA2025019TjmzX5fOrheHz0s/QPluHt+gs06zVsRf16S3Zh/TC7ODfolc/syrcQF
         2raf7LbNRIXGCvML6JFRw7A0CRwOleIjqRGPM3Q+voNwnVzR1IyKyY+SSdcFdNPoJ0Hx
         CNnS59+wJJesL7WJ80S6Xoh+Q+vlZ3t2p4VF+FTCicgVfG+EdGQtKKipGPUtjO2NtpSX
         uTsdPzrN4QsvGYBj0b5wo+tgXpT1ljlnVTB4tIn8OU224MssbTXW+fCW16dnEVD4XlaF
         Idrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774117427; x=1774722227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M45HBzZi/DPHhiEVVmFrD3PNcMJmCosyRbAWgQNCU4U=;
        b=I6ruS3z/KE61h2MVbKyqKcn3Rz9eirV/7p1WxmsCRnjWBq4aY44Kg8lbqxNu54BSLt
         b2ubDgvYaJmzCRMS8s7VXh4lb5tqSan2QU63IpYsm4U+UL/JCNvhpggK8PU8Wu4qoZxa
         DP4Br1KUGUPzhHMHrKHKaRLbD7BR02Gu220sk9iyvEjrwhPgFeAds+7VQO7D4Zt4w8rs
         tNMicA3xjkp5giH5NjlWRZUhZEnczCSdm32vkqXa0rWq9UkYL8wriLdNIw/R+Pw5SiL5
         wYdsqprC/gQ8CcjCcJCkAau7zH9qMNTganWMVKUI/BwAL4vi/z1N3T8czFfwFBwd1dZ3
         kkXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzUjlyqtoWksS9PNzbQRDV2w6+J0t7vl4fYk2LJc/Eh0nTofkWc9kL+ZjnjYhDnNKG3MwRG7hbUG77VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc1lbTgVwiENo05xoD99REfiyRahP17G7BFsGl8TUale+wYYjC
	KMxUdMXt7bU2JnET1Mdx1XAoxx6JnX2ugmdmHnytdjVYs+d1XT6hV/QT
X-Gm-Gg: ATEYQzy/tVRRo62RrDJlZN27MSOw0dMrM8NhfA8ad2+TZMNm0hvc/0OJUWJHYaVSgIf
	Bd2npyjp+JkttiEZKayFZPmCZy+ujQ64gLFrBT2n1t7La25kJlrnoecuOwDCgd26VD1z/GUi5Ny
	GoBal5DhPdqBlXgzB4H1+UlAyJ8w/th5IEkN7vFiKuqvO78KtjOmFWTGW1Su+WLI0RgIqMejObe
	FBYgGAJgdvfXvv59UhjnzpZeAIhvdK3iWlg3nVc1Z3OMXoP9SwKav7gk+EBdIle1j6mfVoKkG+C
	3ZLClYdSjtd/PDeUEx4SpNH6lWFPa+9Zesyaq7PU1SYs1VtAPwvXW8ZBoHeSruIR16VjMA8e72l
	50+iOQl3kNCIOM7ObXELe2bF+U0NjTerX9e7myDeCXEPjBW09dX7SuH5vxDQhUJg6k1nhEVC4II
	7zVBJdnuNrUy7ClfWKtvT9mWXUxYcQtsEyT+YTMV9iGTqJazOc46JryUVHkaAVZw==
X-Received: by 2002:a05:6a00:ad03:b0:823:9c6:1985 with SMTP id d2e1a72fcca58-82a8c22b807mr5751693b3a.16.1774117426892;
        Sat, 21 Mar 2026 11:23:46 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS.bbrouter ([60.243.255.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03aa79a8sm6047357b3a.2.2026.03.21.11.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 11:23:46 -0700 (PDT)
From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: abinashsinghlalotra@gmail.com
Cc: abinashlalotra@gmail.com,
	d-gole@ti.com,
	daniel.baluta@nxp.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	m-chawdhry@ti.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	simona.toaca@nxp.com
Subject: Re: [PATCH] staging: atomisp: u32 over uint32_t
Date: Sat, 21 Mar 2026 23:53:39 +0530
Message-ID: <20260321182339.32229-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260321180330.26737-1-abinashsinghlalotra@gmail.com>
References: <20260321180330.26737-1-abinashsinghlalotra@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

please ignore this patch

Thanks
