Received: from outbound8.mail.transip.nl (outbound8.mail.transip.nl [136.144.136.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83969345CBE;
	Wed,  3 Jun 2026 05:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780465373; cv=none; b=dYoYBF6U9jlQjiM12rY2rSWRzqhIjv9k18fMmIXR0QLyjO+dEU44KM7TQHHdNuLucbR0qe0A4gfSyD7c1LuFqfCMbOmH1PQexNScFuDjsd3H6wi1n8BvPqacEjKF2J9Z9IsNi267cTUnPLigOvv7+UQEHOTdh5uDCtP8J82y05M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780465373; c=relaxed/simple;
	bh=t+OiCA0fgGW32XDK97BfLcV0/2G1+Ke/35//1E5C6Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Wg7+gl6k6OUKwpzBDZRXklErxTQ1JjTs4Ys+ArtZlNhpIUubDCeN7x1VoW1YeQDF5QEtpEtxxJcH5UUpOichetn2sJaiaYSASPLJFB/J3jrMnh88FyY+L14rRJWJcmyk1oz0OtgCgTjxrZRwAl1cRp7vxr1Ni6D5cWbrPY70Sq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=aykPKL32; arc=none smtp.client-ip=136.144.136.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="aykPKL32"
Received: from submission11.mail.transip.nl (unknown [10.103.8.162])
	by outbound8.mail.transip.nl (Postfix) with ESMTP id 4gVc6R0TV4zY75qK;
	Wed,  3 Jun 2026 07:42:39 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission11.mail.transip.nl (Postfix) with ESMTPA id 4gVc6Q3RP6z3R3nyc;
	Wed,  3 Jun 2026 07:42:38 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	Robert Foss <robert.foss@linaro.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Herman van Hazendonk <github.com@herrie.org>
Subject: [PATCH 0/2] media: qcom: camss: vfe-17x: fix wm_done dispatch and silence unmapped-WM noise
Date: Wed,  3 Jun 2026 07:42:36 +0200
Message-ID: <20260603054238.562902-1-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission11.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780465358; h=from:subject:to:cc:date:
 mime-version:content-type;
 bh=ksn7/7m8CZCpcTO9TVXHKuyGKqarKBWg9jQH8kZFjCs=;
 b=aykPKL32BvkytymAVMT2dz9So2gzBtyoWv+pUY3xPPuzFPGkyVcPOj7g//N+EucmgijNjZ
 0PA/zPpbtwHTlXWjPfjFIG3QJPCB9DKQcOLqbg5qdUoVwrX0QGAD8cL1GsydiECRTQC//A
 0ARde+m//KQ4OHX1k68mvSv5x38yd0QXToC0NWnb3DPXEta719A8wFUjzIe4Jztw9Uc2jw
 upG3QPMTpgtR7KWM232enOg+T63XwtwIwGNu8CWpk50FTOnK2fCosovf9RetVeAx+hh/CL
 QkrpRsDEa6cWrGwKeddHN9kuR0c+N5JvKjv/NhYQmnRRlCA9qDSoIDgLLUi+8A==
X-Report-Abuse-To: abuse@transip.nl

The vfe-17x wm_done IRQ path has two independent bugs fixed here:

PATCH 1/2 fixes a gate condition in the wm_done dispatch loop that
used a constant BIT(9) — STATUS_0_IMAGE_MASTER_PING_PONG(1) — instead
of the per-WM macro STATUS_0_IMAGE_MASTER_PING_PONG(wm). As a result
only write master 1 ever had its wm_done callback fired; every other
write master's interrupt was silently dropped, stalling any video
stream not routed through WM 1.

PATCH 2/2 moves the VFE_LINE_NONE check ahead of the output spinlock
in vfe_isr_wm_done(). Write masters allocated to statistics or other
secondary paths are not mapped to an output line; the existing code
took the spinlock before noticing this and printed a rate-limited
error each time. The fix returns silently before acquiring the lock,
eliminating harmless but noisy dmesg spam on such configurations.

Herman van Hazendonk (2):
  media: qcom: camss: vfe-17x: dispatch wm_done per write master
  media: qcom: camss: vfe-17x: silence wm-done IRQ on unmapped WMs

 .../media/platform/qcom/camss/camss-vfe-17x.c | 31 ++++++++++++++-----
 1 file changed, 23 insertions(+), 8 deletions(-)

-- 
2.43.0

