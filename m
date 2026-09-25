Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220134E06D5
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354513; cv=none; b=IXlxai+mQW78Kjh2IOGN4EIrpg/q0M8BHg6GsE1nj09t5hFzobYLkseX0q8Jdzwk4nzaVfU6g/KcZNqmMmaTCu26D8f5wQXJcjoUTj5Up9Q7JkylyFgGN0w0AkfDqhy1urdQpQ/mL0abhA2MIQIpym3vr2vhbLIWcpgUdOZakCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354513; c=relaxed/simple;
	bh=fggcrxfuRaOrEhqaxdzPjwQprECIofXEF06YEsSo3TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bwOBmP2SLQw4q9qqOteoh3t+ikb26RsxPGSE/CwW2VY1NYfjHIm3O9nlH4VbGUJ3NQM8mUtgMwKBsSj5nuO400k7IQkJn+/rQBvRuiVRLW/SWowfh+jpfWPdO6/b/3EZFLhoH/fiSAtvnBAfDy2idPs7SZVEWUeVojmTsKNIaNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=ZjNsImsp; arc=none smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="ZjNsImsp"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-93910c9ff1fso123204885a.2
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 09:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790354508; x=1790959308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fggcrxfuRaOrEhqaxdzPjwQprECIofXEF06YEsSo3TQ=;
        b=ZjNsImspxI7ck/a1axuhV+jVE75x4V+RXSRPRWT4pc2p4pxuEljKc3/bdCZsX8aV/8
         aZcJtY02mahB5JZa/qIm9Z7dJ2C5GrLrCIRh6yICkwAH6i2Cw6PbBZ6D8A55Xjf2gt6Y
         2KbP2/YF81/P+Z1I+Yp6bSy98B/p5SWDfA19ZVluyoq8NUwkay8quWmmmGMcdQ2BzPL5
         OBujvvXAZNWa6Ji0r59RVeVBM1SJ7Vjvgvl0ea8hGcMofzlrCMlXuQ7SzEXjxhlKUDEs
         EOadtXUU7/e/UPPDNDn5DKk2ripXpWKbL9x6nk1zCaIGChuB4HKOr039057O7u6PY3WL
         2kEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790354508; x=1790959308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fggcrxfuRaOrEhqaxdzPjwQprECIofXEF06YEsSo3TQ=;
        b=2AET+Mvmsxa2NL1V2Kx8yXUv3JR4PxYSCwh6y4cR1zE1Ixd5SiO+1vyKzNXTZiP2U7
         9kUAdFp6KnRVXAiCVbwroJypVM+pa1ztw7hTmazYI74obrhNPK3DEbB7oXHHGfZWCN6Q
         2a7FYJk9mh3tKBFk076bljbFVqvizRtGNifZmGDZHQ5d6aJ3zGOtc32En/lnjoRtM1kK
         qW/SkqlYQ1xKOiy3o3+Bv6qj6l/q44xgaB/8nqYCCDwWO0Z0MDAj2PU7JraTMOnZ7NIB
         Gant32pniVwX71Ael1vmC2SdExg6+9bA29o+Ey3aO5R6pzlQanh8s1qB6SQ4spbXTlKT
         jJHw==
X-Forwarded-Encrypted: i=1; AKwUvBybFy7cvT/oHkiDXohhUQ43ofc02izKXgnxOhvylkLERl6huDz0oK97dH1fU+X3dCU/SkV2fATGdAITxQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k4Dcn2AwZXYERBoGGz+zZ9bXcqU6X9J/4WXXOiN6/2zMrry+2v
	D2EYu8HDoE0LUEH016oXNn1/k/6U+sYt+YXAgAf6YAslLvEhBuLjPKvRuJjUNPLf2tE=
X-Gm-Gg: AYBFou3phMtlbOk3h9advZn1NO1HVkd/H+txtIsJ6afC5nSIcXDfEWLRcSrr+Fos5Zv
	uvSNapI3GbA5KLbht3R8jW0cAKpp8O8YHMXjabKdqt/jmpwcNBJL+Fk4yNKOKgmnsjDjwasK2wO
	LF5PywSV88Pa7wEN+5uspiKxyVrola+kV7DUCz9g3bw+f+8QP0ympaSONXwiMNHIRL3sMw/+Uu8
	DUTDt4O+5TqbeiVOFBvA/xuBgXo/iu1SG7/RDvc9ywxdzl6e3VOkrsORa+QI2+nbm9xRe6+JRSV
	QevrDUFt6sTpFET9+XeUbOhQvJn+GhcRo/Rq9mGriYIMM3adhjBftY3lv7o6645No+w4jausafm
	F1A4Z9CzloAhMfDuBwKWnpZ9yooFPqGX2LlMacwl/4iSuiFy8T2cGkmOf9CWSXJemmvv9IKzCMC
	CFy0bdiTewIwrlP/Lu8n8iytRi3cF8ByGsWhoi5q6r3FBJyao=
X-Received: by 2002:a05:620a:2548:b0:93a:2d07:142f with SMTP id af79cd13be357-93c43b833c3mr577686085a.7.1790354507706;
        Fri, 25 Sep 2026 09:41:47 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c54183888sm37869085a.45.2026.09.25.09.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:41:47 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felipe Balbi <balbi@ti.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v20 6/6] media: qcom: camss: Use data-lanes starting at 1 for new CSIPHY mode
Date: Fri, 25 Sep 2026 12:41:38 -0400
Message-ID: <20260925164138.26326-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-6-dc244e124e71@linaro.org>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-6-dc244e124e71@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 18 Sep 2026 14:56:41 +0100, Bryan O'Donoghue wrote:
> Introduce a simple flag to differentiate between legacy indexing @ 0 and
> new indexing @ 1.

Tested on a Dell XPS 13 9345 (X1E80100, OV02C10 on CSIPHY4, two
lanes), same stack as for 5/6.

Without this patch, data-lanes = <1 2> on the CAMSS endpoint programs
CSID0's CSI2_RX_CFG0 to 0x00500211: CSID listens on PHY lanes 1 and 2
while the PHY powers lanes 0 and 2 (COMMON_CTRL5 0x85), and no frame
arrives. With it, the same DT streams at 30 fps.

Tested-by: Liviu Nicoara <lnicoara@thinkoid.org> # Dell XPS 13 9345
