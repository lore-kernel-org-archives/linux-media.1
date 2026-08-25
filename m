Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D4A3B5301
	for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 19:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787685407; cv=none; b=Lm4ijrBtF5R5K79ssI7ZYFeBtOVpYxOtWNQIQhc6P3DEsKNdT6p+0oeuNkQU78kzMNNO/y/3fBOOhoTrrlCjXNCkvJc+ylGndIIPB3RLAU1C0BiZBLNrn7n3tj3TTbOuZLGI1itXVeHBQwycc+fU1OmRF1xPJgZOzEk4vTelDkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787685407; c=relaxed/simple;
	bh=Jg0XKCpCYyIZxGkFuKwuHdy8ZY3Iu94h/9vvihBG5NQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rNASx5SpDXB/948ag3aeADbMsZ+NpW7IoQPtQp3gv2IGbREbBpQATHJ1/lQ5p3m2KACa9B3xDpjKe+l+aO4sYd2gK3QQFW7a6EERMhkZKgPiUPujXM+f8Y9pPW0+PBo9UiLw+qKYHc/DIcnQqwTZlcq8ygc8BQEZqeYBVrFpgus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=So2Wwjt3; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="So2Wwjt3"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81f3b227a4aso1241687b3.1
        for <linux-media@vger.kernel.org>; Tue, 25 Aug 2026 12:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1787685405; x=1788290205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qrKIvtEsv8sRK3OQk9pYABtMjl70C2XTxwnd81XZ1RM=;
        b=So2Wwjt3lcF/MpH69Azcqnun4ci4HcOQO8HlvIF6Sj+9Vdq7wWQFFra9C3G+ucDAvE
         bnpzavNTnQ74KhO2edUaEBuJkEX6IEDA+7twoZs1MgSzhC4rk+nO+TXZhFJfFrrUOd1i
         yHdzHZjk6nuM9WbPaq4+eulnbmo/2bqo+ZnCxPDnHyXjeT1Jix/2lFYjVg6XlmNjtjQ0
         j1etNvlOSKv1w0puK6HgF4eNS0T8KQg4W2g/R0Jw3ZNveR/9YuMTZJFlTkLCtY8/aZXV
         sIJsFZqhkJL/5hdsfYqKrW511+/t8qP/+/SHwZ+xf5SfWjBC7tt7Klrh5Z/5yM3r77ek
         Td1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787685405; x=1788290205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qrKIvtEsv8sRK3OQk9pYABtMjl70C2XTxwnd81XZ1RM=;
        b=WElRNvRwcpRK1OFIzBvza/F6NalGg2t9TF7CWOO2k8Ax+9++T4KQpyWDrq0LrPVW5K
         QCiJJHdmbdRdBfiPxUGbqleHs3xEVocL2TdD0zbkVa0zz9X2OiKUp+zs7/jYO340myZo
         AGq7d3u2hzXgCvDdEg9K/mpCUvuJI5F3hRTpCbH7ATxFKvD3ZTCpcbJPcpz5WXvpIHFX
         oJhJrQVDeS8COQpgzDNPj6i/5GQgAdibeWTTBnJdG/X0RN4Zgov5yta8pTCm3B3jAjWm
         Cq7VjkqufEvi5Fko3xT1Vdygo5N7FnJoXdeQmi5MB0WpHYbdWDXi0Ne5LXBqUGMX0UKI
         3caw==
X-Gm-Message-State: AFuF++mLNEHcc1OZDK6wgdEIStgNuwnqhZE+jAVlPe+r/NwPCPAjKPUL
	0De4jq7PSnqRmFL//OI99Nsqm6rrqWUD+bUlKOjtoptw8VB/z/T5XYO3eG2f4/ykpYMkIFxdY6B
	6q9yjV6s=
X-Gm-Gg: AR+sD12qqaCjSmX5ephVUVstW8U2eNyDYuawNS5FylaR71UFPqVYJY7ZUhliFa7xXqt
	O8F1VC/IFPsTWZIkTqpDanjYuSHOK0ftDcpZ+td4ABorrETVdiRuLKXA8Hy3fDb2fs6SdSM8scu
	t90IEla5QjMhYP/dyNrMlV0M5hMSIX0s3nnnFABhukPyqW2eqZ0usePeiKZehmbz7OKb9hdq/gN
	xKm6TvF7j7WRkGYFavpDMl82oNyay/ZgwIWzpaVAbwpm94o2H+B52t5CO/5d0Y9tMtOMrMjk7Bx
	RmgbjtiA250EwSXrBBXtsEghq0YORs7TNIQ9wicFATZKLonK4G9IIdRPFfuwjmCqZ29So8jyRTY
	BCxYsPRmqbPMghYoFqiZGGesWrY419YylhSDYQd3nWJ8WB5qnjncIlETJ5aJgEXtgaLvbqLMiSE
	vSs3aWK9dTcfiMUyiA6tfvVGBUiDcTb+1Vu6RS4ZshvsgPF5JqIYzGunXUIiONGnR1N9AV0DCd2
	Li99bdweqrsoRHpcr3P14AuJco/s0xEnOsPfjuanXPi9DzAFXp1MpUj
X-Received: by 2002:a05:690c:e111:b0:81e:bbcd:f5c3 with SMTP id 00721157ae682-85741b102a6mr4407467b3.36.1787685405171;
        Tue, 25 Aug 2026 12:16:45 -0700 (PDT)
Received: from localhost.localdomain (108-207-243-35.lightspeed.austtx.sbcglobal.net. [108.207.243.35])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8570d04e004sm4520427b3.36.2026.08.25.12.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 12:16:44 -0700 (PDT)
From: Bradford Love <brad@nextdimension.cc>
To: linux-media@vger.kernel.org,
	hverkuil+cisco@kernel.org
Cc: Bradford Love <brad@nextdimension.cc>
Subject: [PATCH 0/1] em28xx: Fix em2828x PAL TV colours
Date: Tue, 25 Aug 2026 14:16:38 -0500
Message-Id: <20260825191639.755480-1-brad@nextdimension.cc>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I missed a register in the setup for analog TV on PAL,
causing red and blue chroma channels to be swapped.

Bradford Love (1):
  em28xx: Fix PAL analog TV colours

 drivers/media/usb/em28xx/em28xx-video.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.35.1

