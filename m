Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B513998A6;
	Thu, 30 Jul 2026 20:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785442189; cv=none; b=TaRt7XgxdWKnvxi2VT7vv2KucGqtPHt5epZEBmu9p9muZVgU5xxV8ohYSk6wdwuXugGIRyC8YSvWHD2uF0N5jXmdvo93/hgniCoLUx1ZheYInQ1uS+F1Sg+/FbG6zjEVe3IaofrPw3Z+rwxSMeYsEgQmi2g6tvQjUOXtBEHExsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785442189; c=relaxed/simple;
	bh=drFysgT5lqo57UVqTvndRvRXMwHvyFaCDZPmGvBEqjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KkrzJqivHXCPgWsTPSa4BgZR8Vcrf1GhvefPydT3pSPz7JID5NE2f7jc8bEgtPRTSRc/+MSEZxUAD5A44X1OA0wrYFHPg8M91BH2opjWsg09iXL2dPxYYM2fGut9WjKNJvtGl55tPDN7u+YRDafAjXQlQEMUHiET18LuDdQemPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZN2fCi/x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZN2fCi/x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 811D51F000E9;
	Thu, 30 Jul 2026 20:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785442176;
	bh=C5E3y+FPRJicOU+cDWH+RWopaJiiybcrtpnvc8kuspk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZN2fCi/xSscnqSbP9YS7zKH70nnL0GVfLptmUd2UuYSk7DDfH+jIKlLtkOgBEHVMw
	 aW5OYC8D3nR5PxLQtQTBM+FHtH58XfXsxAjXPwYoglbqFgbYMwlF1jcKUtVwKRhUJz
	 HC8VbPdcSOc9XMbZqKkpsSUCY3Mx1CBQyQqn6slQXTYmX2sP7hr1ihbukj9HiGcIPJ
	 2cpGUZxQw4KJ2uDHBpfb3ROnbl53YGesVd/6HVK2LhegmjLvneOsI7L6/fzxgWr+44
	 g+fvPvh57BQdsNn9jDqASOKYn9eZaSgKl1qA1DZd69DdI1SysP5fR3RGHc50BXwKFz
	 IPdvgpCzKbw1Q==
Message-ID: <97a82a07-be5e-4667-8b85-50eb31136a65@kernel.org>
Date: Thu, 30 Jul 2026 21:09:32 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/18] media: iris: Add AR50LT core support and enable
 Agatti platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <J0r-fdDYeS3FyqabzR_0wiwxC-2onZeePkUSfv0NavGV8KB3Anc-j8yKHqfY2I3X4VAiZpRkYSIZLaTwuyhKMA==@protonmail.internalid>
 <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/07/2026 16:20, Dmitry Baryshkov wrote:
> This series adds support for the AR50Lt VPU core to the iris driver and
> enables the Agatti SoC to use Gen2 firmware and HFI.
> 
> AR50Lt introduces a few platform-specific requirements that need to be
> handled in the iris core and VPU abstraction layer. To accommodate
> this, the series adds minimal hooks and updates needed to allow the
> firmware to operate correctly on AR50Lt without impacting existing
> supported platforms.
> 
> Additionally, the series wires up Agatti to use the Gen2 firmware and
> HFI path, aligning it with newer generations of supported Qualcomm
> video hardware.
can't apply

b4 shazam 20260730-iris-ar50lt-v8-1-6597c08cea6f@oss.qualcomm.com
Looking up 
https://lore.kernel.org/all/20260730-iris-ar50lt-v8-1-6597c08cea6f@oss.qualcomm.com/
Grabbing thread from 
lore.kernel.org/all/20260730-iris-ar50lt-v8-1-6597c08cea6f@oss.qualcomm.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 31 messages in the thread
Analyzing 225 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v8 1/18] media: iris: Add Gen2 firmware autodetect and fallback
     + Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> (✓ 
DKIM/kernel.org)
   ✓ [PATCH v8 2/18] media: iris: Skip UBWC configuration when not supported
   ✓ [PATCH v8 3/18] media: iris: drop IRIS_FMT_foo enumeration
   ✓ [PATCH v8 4/18] media: iris: Filter UBWC raw formats based on 
hardware capabilities
   ✓ [PATCH v8 5/18] media: iris: Introduce set_preset_register as a vpu_op
   ✓ [PATCH v8 6/18] media: iris: Introduce interrupt_init as a vpu_op
   ✓ [PATCH v8 7/18] media: iris: add vpu op hook to disable ARP buffer
   ✓ [PATCH v8 8/18] media: iris: Add platform data field for watchdog 
interrupt mask
   ✓ [PATCH v8 9/18] media: iris: Add platform flag for instantaneous 
bandwidth voting
   ✓ [PATCH v8 10/18] media: iris: skip PIPE if it is not supported by 
the platform
   ✓ [PATCH v8 11/18] media: iris: Add framework support for AR50_LITE 
video core
   ✓ [PATCH v8 12/18] media: iris: add minimal GET_PROPERTY implementation
   ✓ [PATCH v8 13/18] media: iris: update buffer requirements based on 
received info
   ✓ [PATCH v8 14/18] media: iris: implement support for the Agatti platform
   ✓ [PATCH v8 15/18] media: iris: Introduce buffer size calculations 
for AR50LT
   ✓ [PATCH v8 16/18] media: iris: add Gen2 firmware support on the 
Agatti platform
   ✓ [PATCH v8 17/18] media: venus: skip QCM2290 if Iris driver is enabled
   ✓ [PATCH v8 18/18] media: iris: constify inst_fw_cap_sm8250_dec
   ---
   ✓ Signed: openpgp/dbaryshkov@gmail.com (From: 
dmitry.baryshkov@oss.qualcomm.com)
   ✓ Signed: DKIM/oss.qualcomm.com
---
Total patches: 18
---
Applying: media: iris: Add Gen2 firmware autodetect and fallback
Patch failed at 0001 media: iris: Add Gen2 firmware autodetect and fallback
error: patch failed: drivers/media/platform/qcom/iris/iris_firmware.c:14
error: drivers/media/platform/qcom/iris/iris_firmware.c: patch does not 
apply
error: patch failed: 
drivers/media/platform/qcom/iris/iris_platform_common.h:289
error: drivers/media/platform/qcom/iris/iris_platform_common.h: patch 
does not apply
error: patch failed: 
drivers/media/platform/qcom/iris/iris_platform_vpu2.c:22
error: drivers/media/platform/qcom/iris/iris_platform_vpu2.c: patch does 
not apply
error: patch failed: 
drivers/media/platform/qcom/iris/iris_platform_vpu3x.c:90
error: drivers/media/platform/qcom/iris/iris_platform_vpu3x.c: patch 
does not apply
error: patch failed: drivers/media/platform/qcom/iris/iris_probe.c:251
error: drivers/media/platform/qcom/iris/iris_probe.c: patch does not apply
error: patch failed: drivers/media/platform/qcom/iris/iris_vidc.c:9
error: drivers/media/platform/qcom/iris/iris_vidc.c: patch does not apply
hint: Use 'git am --show-current-patch=diff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am 
--abort".
hint: Disable this message with "git config set advice.mergeConflict false"
