Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55421B3925;
	Tue,  7 Jul 2026 03:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394507; cv=none; b=BL7ZoI8VooCKyOnc16wLf5pxI14ZpNVjUiU0QACJkas5p+MyXBpbKVNei0Hn2dthM0sWMcbpU+VTxujnBF6tjqu6aWmVWdS4by3aTjaHsrbS+kMcrc/f9bdvABgyUh7Nbh5flD73vU0Lkdf0J3uiDOj9qfg89oLbRYOcz7GbUHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394507; c=relaxed/simple;
	bh=SACH1iT5zxIbInPsb/B4IL5zPsUjX9g0oxe8DXBmoyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PDAL60WR51Vz/t9YYRPvAlOrsGCFrO4Tx8yNSe0rdrGF0MH8shtlUSnDpji9mMhNmftW5bTyTIO6geGtOMyhphlCNKQQlzl0y1f9PFJAiajc3WSa8L4aryvPjB/lZteD4mdOru5Jybv0GP4fhymLMe+7O0ec1jZWKn15CCq8y3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IkXGRVJd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IkXGRVJd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345B31F000E9;
	Tue,  7 Jul 2026 03:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394506;
	bh=z/+ZF3g9h+Uvae25foKta8fTkAbMBje+j4tPX6IArmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IkXGRVJd01W7u8JyKyUzrElA9gDeLg1gEmyY5hUez4Vs64bWo/SjceqA99/wj1/uP
	 2NfjwHNjY0Je/W6M8mBnQXMNqp/q1TXrLYb8rJo/DSQ3k+kxkJmgfXu1Rclu63aiql
	 wFlanhjJS+zmkBReFkz50JnwscrU4yFsw0Guy0VebXoz+1qK/tUcRlYO5++rClsNng
	 fk/NlpV7ZQiYO6bGjDj4csqP4tpNuznuc2p1MYHMcL4JCmfkpwSjbMQXp8uI4Y+O5L
	 tvo4zEuztvSkSCtj+lorp+SWJufP8T9TV8iALMAiwKNIdnN0nJjkRXGmwyMW4Mb9b3
	 nuIkOEsaei/aA==
From: Bjorn Andersson <andersson@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	David Heidelberg <david@ixit.cz>,
	Stanimir Varbanov <stanimir.varbanov@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: (subset) [PATCH v7 0/6] media: iris: enable SM8350 and SC8280XP support
Date: Mon,  6 Jul 2026 22:21:22 -0500
Message-ID: <178339449932.1938770.18155527921257532285.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
References: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 15 May 2026 13:56:34 +0300, Dmitry Baryshkov wrote:
> In order to enable wider testing of the Iris driver on the HFI Gen1
> platforms enable support for Qualcomm SM8350 and SC8280XP platforms.
> 
> Note, this has been tested only with the Iris driver. Venus driver fails
> to boot the Iris core on SM8350 pointing out the UC_REGION error.
> 
> Note, the firmware for SM8250 isn't compatible with SM8350 (nor with
> SC8280XP). Please use corresponding firmware, extracted from the Windows
> / Android data.
> 
> [...]

Applied, thanks!

[2/6] arm64: dts: qcom: sc8280xp: sort reserved memory regions
      commit: 53275adfb07d416a32004612227265939d0df00d
[3/6] arm64: dts: qcom: sc8280xp: Add Iris core
      commit: 3a52eef16b979617156fa6e2ead24ca4d1336f0b
[4/6] arm64: dts: qcom: sc8280xp-x13s: Enable Iris
      commit: 595eb4144f2ecc58e8e56e07ae94407b5a696031
[5/6] arm64: dts: qcom: sm8350: add Iris device
      commit: a2b0c5eba7431e914c85ce9b2c14a4f23e577874
[6/6] arm64: dts: qcom: sm8350-hdk: enable Iris core
      commit: 4a59255c6318881fdad69f8ba62a6003cc2a989f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
