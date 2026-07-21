Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A204499B4
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 09:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627819; cv=none; b=abAQmKhixwW08GnlwKjEpNvWBDAWjcasJp7y04kaEw7dMMy9kHBeUvkmGdZCDEE744XfuOM0QFxNahypW0aEjMaW3+45LTm57NkItHVSj05MGcFXtcWrkUAypTriyBHaU/bGYqC6pdo1LoWELGDlX55KQ6YkQhcnmAreLlc9lTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627819; c=relaxed/simple;
	bh=Gcg+IT6+eQ9C30qzQD969Z8vRx7pDNkFThBtXNgQK9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pohUOLNrMwX13lTj6gwkuEWS2uSwRpDB/+fNsX8f3YDxUd56pc+CRLK4SU0lJuOcF66eh/uAbZUljwk8RjXdPWQqSOHTYrqbcyxZPFSPltwx2iQgM+6qb0bac7q4grv/F6OoMINHtHafFWqF0gLYp7Rn0Y4x0YJcGINOBxRLf3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cmmf0O1e; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cmmf0O1e"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aebe49b227so2697410e87.2
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 02:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784627815; x=1785232615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PlDMh90wfY4dRTCIsx8e18xxobLQnLayOa3bHMPPBVg=;
        b=Cmmf0O1eSNhDl/dE9SY4jDmIDqiPYr7R+tS5sgvK/g1aSqN/26uT3AEIbZzkEGpjQA
         F6sN4R53AGiZqpKnAw4tLbqMxkN2NIBacTVMhWh8YU4JhPK5J9h8XIpYq5jbM4xDKzh1
         AjNjR927d7QxAqkwoXILDOejvM/WnL2VWRcaRmxH2R/+ZFikP/L2xERSZpFqWbwuUtvM
         TgTspazMSFtakWNTK8sjXnFNmj+yd2PP+30h5EuZdHRNnxzAweOUO5t9ovBHABkWU/8Z
         j9VDgmH3BktogVsmW9VJs6mbFLitWb3XnyHh8bYDGkIyPNiPa+nXO1xEd1n4YU2tmXdJ
         lrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627815; x=1785232615;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PlDMh90wfY4dRTCIsx8e18xxobLQnLayOa3bHMPPBVg=;
        b=aDaTr62roui7mF9eixSHK3+a7lce6MR4cckAiSkMsuZbULumfsw944rIKjR5JMkKK0
         W4MjsXARy1vUGIobB8fVg/M62vEsp0BP5QbKcTb4Y2Dji3bhfubKjttstAlaQWCUuNJ6
         QBQkmY85ZK1rk/wxv9pa7RKRoQHMOHf3T10wHQq/4qvW9xDGib5k2HhYx09SOXkvbHuA
         sTroZ3Hf9g8uYuSLGUL65mJXWUgJ1m+mPsYNtEpdZIJ9qJj25OnhkbufNjW96AF9N5b+
         cKnRELgz1AuMwTPqJ1DUW0ZteYVy+mu5u+ny5LgO2MZ19G8nNmSofdRkXQOkfaEJUWNA
         F3Sg==
X-Forwarded-Encrypted: i=1; AHgh+RoU9qA29ZTcsCxvNgNNd+CwKeuQKJAQLDgR6++aArNjzzlc+gBABGFgeceHWpOjo5Ht0ZX6ft1ht2Yn3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgaOeLpYV+P9/5igWzmP/rn/E+/NTdo6iMHWnmPxZ6H72pwkm0
	fOYMJciB+GhgACDFODgjPXbZYJXH73Wky6ECRQRBM9mSnLOszz1643AXYiac4CwZyEA=
X-Gm-Gg: AR+sD11JlbCBAjgPo6i2dPWf2FewxpccKVMKlFOVpSAvV+z3bQUx8lt/LM6AC0t8J7M
	nlE+dc1sSymvNsCzxe3kaWS1FvpDi/MNXMKKiNnHlROTYo5BzonsjRM94kowc7rTez8Ue9pHMed
	XSZGV5qGNRiTUPJglI9oiSXIysj7k4K0tXC8EJtiOxpYz94sedt2/fIGSumvgSiLq8k0/Own72x
	JSBSk6RPb8FSvFWG+eQNwRWxW1uhD6a1ayS/VJJa2a2UkZ8bQjrRlANSpe4OdISsU6SScDu2KoZ
	ooergBQXC7NS2OVXOte3QHjZwEYMOrq6Xcmafk2ekQis8O/iL8nJCunKRN4VZXUtHBBbL9H0Bzp
	vSSd25D69dY674HPm9ULiHtyBu4GqzNrgDYkOLpJzL4t26w1YaFsQqu5Gimawq/PHdjbNPGGoOi
	RWM5OV07g6/OHSJKQSeIS5TBVn5YQNybfjzFvJ4aQJr2fMOYEu1YitdWqm
X-Received: by 2002:a05:6512:3b98:b0:5ae:c5b2:9cbd with SMTP id 2adb3069b0e04-5b2a4a7e164mr328522e87.4.1784627814976;
        Tue, 21 Jul 2026 02:56:54 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e18811sm2797516e87.60.2026.07.21.02.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 02:56:54 -0700 (PDT)
Message-ID: <345ca98e-09f6-4965-87bb-e64dac096498@linaro.org>
Date: Tue, 21 Jul 2026 12:56:53 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Bryan O'Donoghue <bod@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
 <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
 <LyWJAb2qKsAFTMHNJUce9VqoqbkFKUQanb6z8ziA63RYZ1P9jj1XpA83uGPvz9m4QnWvEjJFK8dGD_8EtioHVQ==@protonmail.internalid>
 <0da6d314-bfa9-493a-bcc6-8c3b75751d0c@linaro.org>
 <88ae6662-cb85-4e3a-bbb5-1b536348df34@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <88ae6662-cb85-4e3a-bbb5-1b536348df34@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/26 12:39, Bryan O'Donoghue wrote:
> On 21/07/2026 09:17, Vladimir Zapolskiy wrote:
>>> +  "#phy-cells":
>>> +    const: 1
>>> +    description:
>>> +      The single cell specifies the PHY operating mode.
>> This has been reported before, #phy-cells shall be 0, the operation
>> mode is selected by bus-type of endpoints as it is described in
>> video-interfaces.yaml
>>
>> Two competing values are redundant and it opens a door to a wrong
>> hardware description, the technical discussion has not been started yet.
> 
> So as I said before, I'm following Rob Herring's input on this and
> Krzysztof has given RB for this binding. At this stage, I don't see
> scope to change it.
> 
> Adding endpoints was already a compromise to address your feedback,
> which I hoped would bring you on board with the design.

That's my comment dated March 27, 2026, and it says moving phy type
from phy cell to the endpoint property excludes the need to set any
phy cells:

https://lore.kernel.org/linux-arm-msm/e37ce438-12c7-462d-b2bc-1351be62b806@linaro.org/

The technical comment is left unresponded so far since then.

Since there is no expected phy cells to get on consumer's side, and
since there is another link between CSIPHY and CSID described in
video-interfaces.yaml, any kind of dependency of this IP on phy can
be just removed, which serves the purpose of hardware description
simplification.

> 
> There are several SoC bindings as well as new CPHY features which are
> gated on these changes.
> 
> Vinod, Kishon I'd request to merge the changes as-is.
> 

-- 
Best wishes,
Vladimir
