Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44654A1DFE
	for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 16:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354487; cv=none; b=BsaoVNWUzIDamCNyW+LERnrUfLJfnSP6miRmYeX+H8hwMf+7qPYO3a2eI6cnHfHV6QbXQplkab2yCKROFFzKVodWEascUW4LaQ5Mc3mcHPTp1pCfSABk5OxjnjvVAltQbzHQogSArg6U1rmojzEV0uUID0RmUg9Hs2H19nCFvDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354487; c=relaxed/simple;
	bh=6Gd4vf7bpYvevr/XoLpiMssWOSifiMZ6CNt4MPZA9zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GO34eRdF/9KOxeDUujKQL1s2Detwj7b41YjMtAZctY/cFf0MnZ+E02xrxwYuIRWTchacKYxyR5cdZrbdqzWyzZ0jdJnca5ikhU35G4REyHtdfRzbZ6/SbCHdqKrms8baJ3sd7ugAAicyOl/btCcKPgvnl0Nn6kPX1p1IQZ+I3r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=ZPVmwzjP; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="ZPVmwzjP"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a2dea320fso109529185a.2
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 09:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790354477; x=1790959277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Gd4vf7bpYvevr/XoLpiMssWOSifiMZ6CNt4MPZA9zs=;
        b=ZPVmwzjPCgFbxehdiQntsj2eCKJdbl//1zWkim3xVQsVZOn5eDTac12e3DfVhKSN8C
         rXI5U6hA29+CHnX4aqdYM+3aaitlnPh3WzWcE855XhjykP8iUb0lM5WtLLZclmY3aXGs
         Y9Eunv5JcmbFTQq7aInRAaoRsy+1eJlWW3aL+/63mSeBVqZg00Cq3bbtgtMcph8ZPA95
         Sd7gkHrZPF4jczy16gYAkhfGa/GOVm21WbVAdaAe8IdnTnlo150FgnidXPcNWfQKWZrB
         1zlPXsh9HSnabZI2CleXw0tk5TgdVgTM2D1CDRFLR9L5FQnBV/fD7i3p71BTaOFMu247
         5CMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790354477; x=1790959277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Gd4vf7bpYvevr/XoLpiMssWOSifiMZ6CNt4MPZA9zs=;
        b=wd/tFgrcFk8mGzVJKNZ/joXv1rJENpglNcgAL6L6VZgDnWwjyMfj0jk7Ca3vOCfiY0
         KV/pN+cRtPXMq851kawFfQhKXxxlWZ39h1ama+LcHlnStiyuTmjeO7sHgW2glQG1vka4
         87fQTInJGf4tTKNGvTjbOTJiAk4ZxSkSVABBBiUk4P6RFFDaKCExK36Yr3eB+b8etNkN
         pNHCsWkVfGL7il6q2QO8gTCPNnTPsuDPvvCwpyJUFStClV7pQY/gLOj7o2FqCmg7IIjl
         8Ket4CGvtAg8VRcHMD/7LB7olVlnnTM7uw8CJRkNbfaAwOoesGjIPBgPz8N4RGAymDUf
         N/jg==
X-Forwarded-Encrypted: i=1; AKwUvBwiofrtFvXIF2s05B+hy241Z3LGd8UgaJCk8YwqjWlB4o5d1FM7RMXEdFqW2U+sPLADEDCqR2DB+qMa4A==@vger.kernel.org
X-Gm-Message-State: AFuF++nr1AZGVj03CSXTNYOT2ijPAu0THwuvV7HqwCxBGW1k1P4JjR4m
	Ep/xTu7z3GEHYoWYjWQ/dsQWRZMb1+N6KfL1af+Q6BygkeWzQ+pXkBiYBm0xxHb07wY=
X-Gm-Gg: AYBFou0jKIrZPz/ZF3/mbJAIPOGEQUVdJpCP95LifU4wC6E8AaynfkBiqriv+UQX2Vl
	jh0mlgsO51NVLEBlwE29ljKx3Idpk+8WJevTp45OGHxlTXOGSr8Wv8JC8qMr+aG9MZwD+maK/7V
	/cLRfhPqczA1QhbMdmws05dhOrW4325iZl/ovu7lAFm/v7MgWs3j5GfGDRY9V7+7EGV93jOJjxA
	WGKPjXJ36vgaCsZT4q0qOhMX/iKBgTz9lV7GAkz2CqJw/ZrK/DoJg2PWmdGnfkkdEcleni2fjKg
	KccyagSBaijpp458pilydv6N7hjK74EiVn7t9bWKwKOfJl3+QtsbwVxvjnr2t94ziFQjnra8GEt
	QFW4O268hSkaNNr8bUfdeMbuNY0Yn3ysRIzhQXYQQYKDb3vE1LMmgXSyffQkJxh2B/7a0dS/LNp
	D5eZ1ovtOzmbPnoBNQialn/3INWOnle06gtM/ycEJgQawqljYwzkJlFIG/sA==
X-Received: by 2002:a05:620a:414a:b0:939:9b1c:ea4c with SMTP id af79cd13be357-93c43bc93b2mr592149085a.28.1790354477368;
        Fri, 25 Sep 2026 09:41:17 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c448ae8ecsm217064385a.9.2026.09.25.09.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:41:17 -0700 (PDT)
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
Subject: Re: [PATCH v20 5/6] media: qcom: camss: Add support for PHY API devices
Date: Fri, 25 Sep 2026 12:40:54 -0400
Message-ID: <20260925164054.25831-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-5-dc244e124e71@linaro.org>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-5-dc244e124e71@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 18 Sep 2026 14:56:40 +0100, Bryan O'Donoghue wrote:
> In the first instance the code will try to use the new PHY interface. If no
> PHYs are present in the DT then the legacy method will be attempted.

Tested on a Dell XPS 13 9345 (X1E80100, OV02C10 on CSIPHY4, two
lanes), with this series, the CSI2 PHY driver v18 and patches 1-4 of
the x1e camera DT v7, on 7.2.6, plus a board DT for the 9345 (to be
posted). CAMSS picks up CSIPHY4 through the PHY API, and the sensor
streams at 30 fps through libcamera's software ISP and into a browser.

Tested-by: Liviu Nicoara <lnicoara@thinkoid.org> # Dell XPS 13 9345
