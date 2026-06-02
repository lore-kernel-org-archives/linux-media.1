Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB573C456A
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 15:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780412659; cv=none; b=MDeyoy1Jm+if2DYs1+Hz4Q/9DibaejdLEPQfMKw+bx+RqdwX9cMwsn+F4H+UuiQhL/nueS2bCKUQLlB4L4Pv4Im5NhspaiDZ+od4hm9hSQAJraoQv9QY2Lo0/w1fYXicWhgZhgYhp4kZfrjSJNOxB9LdzRH9tV1bIQCGALdvCqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780412659; c=relaxed/simple;
	bh=hhLyU1suKqRemMZ3uMjdPzeVwrqN8+HIhvS6Kah3daM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tzPMypDJ+G//yHm8OjL+qfPG5E8vIC+8mY0zYfbh/9Lg0E/v6e+HWH6mqgiy+OYDRcuvTI1WTdGhgmFmQfE4g1q+oyxiK6M+eQ97KT6kh6RgFCyJghk1Hnbc0FL6S+UX/lnShaDFyR78R7KYfmJiyJtShhKmbdq2B9OL2TgjUUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=BFgAAH/x; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="BFgAAH/x"
Message-ID: <809635d9-6e66-4ace-8f47-4a5a268f4f18@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1780412652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qHszsEN8PB3ekey0lEf70Vm5pm7eZsuxWjxfuJZ2+RI=;
	b=BFgAAH/xcynmV8UeSdeG6LKfgfP4MDNJFZp6R2gs0qShyj4nudTtq4HPYoLRzSCxM9Q07h
	S1Bs1hlDJFHvewK5FG2GtTvPu6On7jrT47U9dCsObZJ4qcmTaYpELOFFDop47C1nUjkdKp
	4p7LeOgwfHBZmMNNdAtTmnCfVnAO1hS2FmTw9rsw9MUR/HRiPwHhL4aZinED5PCg04yoiX
	8il1U+Dw6dtacMog5D3eXtfu0UsCocDvUxBGFAFRLycFYJaPCl0kQt/ARiekfRIXJy36bl
	lF0nMon19m8s8y3wQlA7IqUh9deLu1ALcxMtcXUaDeH3BVHO7Xbjo4pfwMyoKA==
Date: Tue, 2 Jun 2026 12:03:53 -0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: Reserve low IOVA range for
 Iris
To: Bryan O'Donoghue <bod@kernel.org>, Daniel J Blueman <daniel@quora.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260601041336.9497-1-daniel@quora.org>
 <ecavEnqJTDXvfFykc9uJb5No7ioighpjrCdw2CFZ4c8Izr5DxpTs-606Bg7K0RtHTaOqksWivHxWQLzMBP6qow==@protonmail.internalid>
 <20260601041336.9497-2-daniel@quora.org>
 <ec7c564e-745a-4998-af9a-e9632fe063f7@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <ec7c564e-745a-4998-af9a-e9632fe063f7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 6/2/26 7:26 AM, Bryan O'Donoghue wrote:
> On 01/06/2026 05:13, Daniel J Blueman wrote:
>> On X1-family hamoa platforms, Iris DMA below IOVA 0x25800000 (600MB)
>> triggers unhandled SMMU page faults
>
> How do we know that is a correct address - does it come from qcom 
> documentation or trial and error ? 


If you follow the Link:, you can see that it does come from qcom..

https://github.com/qualcomm-linux/kernel-topics/issues/1157#issuecomment-4458933574

This series is basically a "hotfix" version of a more complicated series:

https://lore.kernel.org/linux-media/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/

that introduced an extra subnode that let the driver only use that 
restricted IOVA range for non-pixel buffers (only those actually need 
the restriction) but that resulted in a very long discussion and was 
kinda shelved because of that.. x_x


~val

