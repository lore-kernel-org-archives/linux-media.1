Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F55052BE4B
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 18:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571030; cv=none; b=TLsj+9iK2crm8u1/ouCcE5PgcL9pCXkO2GthA9i4My9FeO3RslBahXKBTaA6N53DOPdmAw5ZwMqElSA7m29zViyL4JnV2XNEYXvU4e6afsci1hwhQxz6LiaFQm0/9juqMHixXIrFK3lg3vaAzR0EQsId1kZvHEBVCyr3FSucj9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571030; c=relaxed/simple;
	bh=zXUXbkbHKhygzVpTe8FZqACSsuvTnFfmhGdJxYgNu4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LYM20l+huP75Rm1nQoKXTeZL188t/lHTpq+oGWMCStt/EabLof6QpyobjSrvseCOQe81li3Em3LDnNDYE3T5ZPy0HghC75WAIwY0yRz8v5HpX0pJTJ1xrVmrweIU0H+9G0LU+lsUHifDk2SFEbVs7bB80dLIpaOAAR0/GRkyUAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wo61RP8W; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wo61RP8W"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c411d6615so50617f8f.3
        for <linux-media@vger.kernel.org>; Fri, 09 Oct 2026 11:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791571026; x=1792175826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zXUXbkbHKhygzVpTe8FZqACSsuvTnFfmhGdJxYgNu4w=;
        b=Wo61RP8WVbfuzSgDt36QUF0wRPalMDlCmfVtq5UpWR8Pb821wjj/+SoAtMZwXtGVts
         Z58S5MoyJ8FjkPBe3VaXuhFKNzVmBiS6WeSgicMk97+9Y6bIOIZ9JbQ8wXm6sfkztstn
         XvgnW1ba/6AGaT1NJEnNEoASpqDd/nLbfKRwd9yS8vI2e6t9xzhk8Fv4dBcHSu9BH/Ru
         RvT/NUv3lOQge8BwJ5lbHvt5Cdq//iOF4K9b+TOC5AcogsPuMEu5MFCT3MKb7+CA+6c7
         fGHcSw5FdMqM6SOt1lzktknisIbU7MLpKch1g2q/9aSswej1hdqLdhN7fUSbLHOhz2DZ
         OH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571026; x=1792175826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zXUXbkbHKhygzVpTe8FZqACSsuvTnFfmhGdJxYgNu4w=;
        b=vWRg2bp+YsQzqSprOMkzCA2lFPFsXgJj1Ej4ZAR6CggMxPh+EBJDzOfw3lk+xUPy/z
         NgE7tdDhUCVuCxZPz7uN9fu8CqDU2lZ3bOwQb20M/28sHxBCSVQ4sfxBjIPFtUerKy1U
         N9B3UzsCXiVTEoEeIpcXcMH+qGJOMaYXII5CAxeqt6zrHNJT42RknbAQ3nKNVhFAdXnu
         RnscSiiMTSKVwn/hAB+wPeaQTjJizPFIOttYpmsGgpSUYTfHgvlUXne+3Gzy/I3eaowP
         V7cx5nHBsEpSjXZOUndkYt8/QnpSzlci6Cpe8IwSzRN4wsrjS+6XTq9gs+Za8JHtmE2h
         dQ2Q==
X-Forwarded-Encrypted: i=1; AKwUvByw4xWfl0HCOC+yp+nOLTjFmtLww898U0DiEUFXLZxOu1jk5rKE3D0aDjgDKO5gWtBVzPk53clCfmwCqQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJxfD0RxLCvoM95tMSYjfpw0zQ9nb2UOP5r39ArsQVJm26bKXVW
	G2A+8Gqs4KRvL3/42Dj5DnhOnK9Zi8Rp422NfxEA7IUKOUiIH2JKLpIJUxrGqAzU
X-Gm-Gg: AYBFou3WgpKtpuT19byz2vR1BFyufV6ynIEh32mpkg+DNmoontpPLZtC5HFsD1UuumS
	wj/9qBSZyIQPWQjVOU+jOgZJxj9Pheea+YPMUEfy9VKZX9NwaziY4+B7DtE4FbCxc6wbnaShdxD
	HSrir2okftDwxj1aDbrBiXTn0jrlahJCg4uuZhZENTfoQwekETjBSd5jQLNfTtYb+ICwVgGXHt9
	GF9col015K2OIRhA1KugP10GR2zQlmgsdbybMk32WD4eyo3mpUGaH/WnOg4+hn/PVanaNzsWRBv
	hQ5wzM4goFO6uPHMnGOiu3jMlKGy3NJTU902eSE0rdYdCZ5pfJq7tqNzg6iFAkIuHsBHUySSsHA
	pus7n4MHgtOnC2u38En5oG7RqmEZlhEXBVSZlcETG01Abjte9QLXZH+anI3jhQtNnHq+Sj3UZn5
	6sKr2PBDHpBt93lEWayLN6FwvmyN8rDNJ9xey/CLG2H3A3a8wMLdr2bH7BYABW/ybBNY6nORvMz
	cDQbYp3HnnT+TnuXxyTWK817H4=
X-Received: by 2002:a5d:5f54:0:b0:48c:5306:c11a with SMTP id ffacd0b85a97d-48dbaaeb832mr5386352f8f.24.1791571026351;
        Fri, 09 Oct 2026 11:37:06 -0700 (PDT)
Received: from ekulyk (78-80-42-240.customers.tmcz.cz. [78.80.42.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9adeacdsm5207221f8f.55.2026.10.09.11.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:37:05 -0700 (PDT)
From: Eduard Kulyk <kulikeduard89@gmail.com>
To: j@metarealtyinc.ca
Cc: Ramshouriesh R <rshouriesh@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v6 0/2] media: Add Himax HM1092 mono NIR sensor driver
Date: Fri,  9 Oct 2026 20:37:00 +0200
Message-ID: <20261009183700.71021-1-kulikeduard89@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
References: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jake,

Are you still planning to send the x86/ACPI support for HM1092 on top
of v6? I have a Dell Latitude 7350 with this sensor (running your
out-of-tree driver right now) and I'm happy to test any patches on it.

Thanks,
Eduard
