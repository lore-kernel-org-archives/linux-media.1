Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C347361650;
	Sun,  5 Apr 2026 19:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775418046; cv=none; b=hME57duQiEhRCMkw4aFebHDZBIUUdRDOw5kChlPnN+C77mohJsoN+dpiUf5W/Pb1K/lAlQ+o86u7v3T3PIUfh+4/c3Ki9PI6+u6AxBr3SJzuWobrQC3qH5MKqi5Z4OEfl6u/tWj6JIGnGgmIAq2BI6yiwBnRVq6gYRYgVV585wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775418046; c=relaxed/simple;
	bh=3zNQYIzaQVmBMJ4vdPsrtz0iIHjcPdUtGq4nCKXqRXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rUCx44qy9s0E4T3XJoSYL00jR1++09D9MH6jGj7hBYAhICnHS069tBzgVRIPwWNTSo0tOuQ+sR4XpxRRUFjF4f1Nzxk6CNE6//MqiTL9h7hDb6vDCz5HEq40wUeGKsYZTpW2HbjLfpHSZoJ32U+nQnAJWU1z+v6MdNW1tFzQBo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZPNuHMA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZPNuHMA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE106C19424;
	Sun,  5 Apr 2026 19:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775418045;
	bh=3zNQYIzaQVmBMJ4vdPsrtz0iIHjcPdUtGq4nCKXqRXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IZPNuHMA+rWoYE1aO+aWq8gXP+bp24EOop8Lp2B11DsdZFra9PY31shGYUrUq4Ozn
	 h91Xcy7fzDWLPXGNNJqOdYBPQBafTkFHfrSJ2hCD6jbURBv3+zBog9iryzKt7WeHbJ
	 lYJ+uVOeCGtUpxSFYa6aNe/7q2BS1wuWCe/x8r/urSofykeNkspEJ8XBZ4oUpG1b0f
	 L7mCwrCHMVIbZ4LYBpVeyIB8HVArfEKEaNo70c2HNhYOPz2ygPoA5pO8+ucNRyqlLn
	 6LlCtKxHubtJjhKinXnhckdlfGm2e3wNAMIh72wxtXfP6xKa5UkqGbcNWNdumObE6L
	 /5nSLpO+GDTDA==
From: Bjorn Andersson <andersson@kernel.org>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/3] media: qcom: camss: Add sm6150 camss support
Date: Sun,  5 Apr 2026 14:40:25 -0500
Message-ID: <177541802138.2061229.7370211760249071769.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260112-sm6150-camss-v4-0-0cd576d627f7@oss.qualcomm.com>
References: <20260112-sm6150-camss-v4-0-0cd576d627f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 12 Jan 2026 16:04:51 +0800, Wenmeng Liu wrote:
> SM6150 is a Qualcomm flagship SoC. This series adds support to
> the CSIPHY, CSID, VFE/RDI interfaces in SM6150.
> 
> The SM6150 platform provides:
>  - 2 x VFE (version 170), each with 3 RDI
>  - 1 x VFE Lite (version 170), each with 4 RDI
>  - 2 x CSID (version 170)
>  - 1 x CSID Lite (version 170)
>  - 3 x CSIPHY (version 2.0.0)
>  - 1 x BPS (Bayer Processing Segment)
>  - 1 x ICP (Imaging Control Processor)
>  - 1 x IPE (Image Postprocessing Engine)
>  - 1 x JPEG Encoder/Decoder
>  - 1 x LRME (Low Resolution Motion Estimation)
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: talos: Add camss node
      commit: c0b357d5d059812e5b48fab81270d8f4c8f62162

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
