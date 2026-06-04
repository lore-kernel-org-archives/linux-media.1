Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0063988F8
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563710; cv=none; b=V8n5FpA3s0xdvqBZhzl7xE6bn+QjwKh2yS+eLXihlMNWud2fE2Hg7JCxL5P+D1i26E1KU6HE4yDsaqQV0tfIjvgNmUCsL554U1UHsusu9sdkoO+eqQcsGe+n4B5WINP6Yn/mWlV5tTM840qf+C5dBvp9Iacajj+qeEttPAfwD5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563710; c=relaxed/simple;
	bh=A+ONAJcpATPpdKzRx9vVYq0qKONGPEkY1AwbFWAF32g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NThsr6BXgvMXlrTD7Qm8n06H8E+UqNHxqaLEWuWqaa2I5dYELajosm4Ps1SzRLlMBC4iFb/ewX578STEY9kOVHySatdS17Xi/UMITn5jGeeK+oIm+wuEjMW6SOlUg2Pni2jANjmMIXn45W4FIr1Httejwd02NMIOa85NTtlIlKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfetxW1V; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfetxW1V"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-304ddfcf72cso463525eec.0
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2026 02:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780563708; x=1781168508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eJ/sx7/ltcdaqGki6/rt6gC1u0dQybWtjhniKzJFM0g=;
        b=PfetxW1VAoL0/VzBFs3wfWleOAVbCRp/1yBwrft/JaU2uWcYR5QUFapUKqozj76J+R
         9Yq5fT2bFnX7Dhd6JB5elpn7frbSnX3mq9QRg4XfyIv+13N7W8IEYS3AxwDUSI87KALt
         aNYnAqlqrd1Li8QCcnPqbxMfLAlD9cS15yauuslmHOv2LjuTcCf/RwxmPddx/QSWtoEI
         VDQOWGCU+W8K7IWnPIMzLTDiveU5EhQPrbNn6GE4lvCr1iItqAQQvrHysVL+isORB4fy
         PXFtxK4b5DjtN1pK2+eNkW5ipTxNeTbMmQbQ20xqYd1dB8QfqBBjHQxriDOdCgBnLTgF
         hEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780563708; x=1781168508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJ/sx7/ltcdaqGki6/rt6gC1u0dQybWtjhniKzJFM0g=;
        b=HTsm2eY78F+yLDQU7GjRipPZTBOb5L+jEm6a2WVLKoOzu/tIuFAqNa7+xfpvqmac9S
         PHzTFN2JiMEl23veQkrzwUqSRuRD9TFpVWBZEWccAEsPof3vgYMjLyNCRplJZ5xETbdd
         5wkZNqfekJNG+oVxN/QJfJDVmQv/oC2qaVMx4KNjuYmQhHquFefZpWCjrKWu+4YDO3yR
         JVEaplsJxLJLgoYMJK7k9sV1y90VxT6f4HrMMvBCj9h48uz+H5hReQFaLAnPghyRAlax
         6QtZsquUD5oE30R7y4QkejJX8TREmngmGT431RAG5MJ+DBfvNODGgNTUk+XHEknAXiiH
         M/aQ==
X-Gm-Message-State: AOJu0Yy/kvtciG4/Sc/rAlFp4uW8In2HjxFYxGGTrKPawcRDmQXKWpJr
	fYlCmyPESMdPJO7IjlfS0Cn1g/06EOGQa2TxSnivbMArs5/qjqZS/hXVpfyasBJ8
X-Gm-Gg: Acq92OHpf6JDqnxPTHWlohDHWgu3jH/ceDUHxwRfD0MAhjvbxNk9re17r1j4EfB8LPN
	fLt2SZIVAXbpOtpaRWHR8AFr8AmnOJxYJNPRBGErnZPLf9zQJtLMh4LJrFbKs//uyNtLsEaHKYa
	+nbDKxBlnOp5y+ZzFjt8hHMFjobwOH1iGDa0c7MrtIfzDQi+BJpUlwR2PEuKHGYk/klli3Q4MUa
	64gGseZQ2MqRs9cRXeGYVZ89oLKe/T2vBEnHlC9QRMqiXYKkAboN8x5Dx3EGK2wg/NQS0X80tr0
	SDKnhs9urJuNpRcgOJuakIZCsOQvVBYjv1iOwRI8U/MwJ64OvtjIiE24zjZsNAqKvdxKWq04TU9
	gA97VhVnnHs0jqQ0GjpfF0EcO4KwfZjUYVS03p3bfQLF5M8aAxvYqTcuKWwDpJPlM+6+TCOOE5Z
	cqwVk5HgbPWOMOefdz7uSQxKyn8kkERqbsdzZfmfLJXLtI1KYDGGlEqFstYsGa6zVzQg==
X-Received: by 2002:a05:7301:6006:b0:304:e7c9:b528 with SMTP id 5a478bee46e88-3074fbfe7dfmr3677659eec.30.1780563708109;
        Thu, 04 Jun 2026 02:01:48 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df8076csm4892717eec.29.2026.06.04.02.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 02:01:47 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3 0/2] media: qcom: iris: fix runtime PM reference handling
Date: Thu,  4 Jun 2026 09:00:57 +0000
Message-Id: <20260604090059.46355-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes runtime PM handling in the iris driver.

Patch 1 fixes runtime PM reference leaks and balances runtime PM
usage counts in the power domain enable/disable paths.

Patch 2 complements the first patch by rolling back the OPP vote
when pm_runtime_resume_and_get() fails in
iris_enable_power_domains().

Changes since v2:
- Convert the runtime PM fixes into a 2-patch series.
- Add a follow-up fix to roll back the OPP vote on
  pm_runtime_resume_and_get() failure.

Hungyu Lin (2):
  media: qcom: iris: fix runtime PM reference leaks
  media: qcom: iris: rollback OPP vote on PM resume failure

 drivers/media/platform/qcom/iris/iris_resources.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.34.1

