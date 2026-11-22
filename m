Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365765;
	b=RqUx0blt7P4OVGHT6Vz6DnNKLrV7YovPVqX4/wNd//THxCywACx+FB/BECLRVJ91bmmB
	 lRS4Zeinz9KxwbVvN/w2Eip4+b/yMVwURGc58QgtMd6WGAiE2S3PDL65Le70RhEho4ksV
	 5/n8JKNwvFlvuRGl1jH+df0o/uhiVzqChDmdH91Zt6bBRT7BRIZU9tkOmIZOh5dueQkft
	 /0gPKoZ8Ua5VDil1nuySFnjWxdbtX2uA5Na6V70eE0iyJ6i+EQdIlAFb78SgXwD7+HUoE
	 3sIcmJ5bu+PXWZIHwxehdBsttQ90zjTHWA/U0wQa9V498pqn9+HxGtSPTJmnN5PSsRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365765;
	h=Received:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:
	 From:To:Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=E+E7FmiEKuaaYRlPxWcHAuF3YH+qpXihRcyCMIyBDEw=;
	b=r1GA1cyZbl0QeKr/mV58WVuBwOuHOxrYOXTXIzdRbV6w7gS6gkQUb3J/b+0Eay0+Z55W
	 HKO8XrYbzSUFsKCe1fhudRK601B0mPQe1XMO6NSxUrC0uelkZxVV171P4uxJ2Of4N8O52
	 6dfrI/828MPtXrHjNIdJ5HDnGRpZATFaRNxfsk1Ueb4Rb5dp2Y0/Tlf8iI7WJaPMwQ5tF
	 uurI/viaPAxdZ+U/HB3DXbg6V8z5UEvp1/9x+Xa/CgKD/PbcV8cKpaJ9vEkkeREPm79Le
	 XElv5qzBrXvYkfMr00zjMdh/+3geUW6tZifjbKEdwRs1izc27gwHU4ELyit10dLew4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF78606A681;
	Sun, 22 Nov 2026 16:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C401F000CA;
	Sun, 22 Nov 2026 16:42:43 +0000 (UTC)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v7 00/12] media: iris: Migrate iommus to iris sub nodes
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
References: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 17:42:40 +0100
Message-Id: <179536576019.207250.7528913659904362125.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1933;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MPwaYsn90U1KNYY8OLWHVcTJ+5w68nsr+QZMJvzf6v4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAxuAn6cK2uTgiMM3BkAkFwOpnHqElaCgsxtlv
 4lvWQlyKweJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawMbgAAKCRDBN2bmhouD
 1/8JD/9bCO9ivWkSUpFpsLf89LbBrnKu0IHLSPGOOlB85leLA+CGbnz0sQJxAY6xjtUwNGZGPF+
 y9uzTW928l3ohVxLoBglz8ftfN32XS4T4+gQOcdHjUDDi+zWJ6uK1HAD3+/EKWYVKakLdoMqvB7
 2Lk57IdWs41hMgWE239Mi7U2ISGIPev3rM9N2rvSlXyIzF9Qtdr0AMdo57gPVrQaf3OS7nU++q4
 wLzZAbSNLdssh51WYfjZpGxwE8/RGY1LzGms5vvFSlmItKoeL/9wRU07PefT18PkZiGoO4uHfsO
 dcA+h+pH3Ok2r9ocnU8wh3RdLn6O8aHhDwxmEzW/W1KjMBimJGKJJbYxJT98JFaVLHAZMATpd76
 rr+ze9f+eIXKNlYNyMNqRqLe5spoJLL30RJcXRud3qg3dE6dUbZd+EtYRBYiA9eTh9RDL7vXINb
 XwM7aZewv+pvNG5i4HhPf9bIjCIRJqNy9frVAEGuBG2ykFCrneiNWb2oIjPxr5f3dvnn0OFCvN6
 b5kR5Q6yLC6qeusFkfeWQqx7oEjo+wIHv5d3nydgAFJ2r5N54BdUoM1cvp770WnpzXlY72yprBw
 /CCi7WZ8lI4ZzEaTo+lRUJDwrHezYXzcNDEnoMWXZhprA0ETMeq/gYtmzPTyQDrOWl9Mvq9klWR
 in36n4cfrk1v9ig==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

On 2026-11-20 16:40 +0530, Vikash Garodia wrote:
> The VPU issues DMA through several SMMU streams, and the hardware does 
> not restricts specific streams with specific addressable range. The 
> non-pixel stream is restricted to use 0-600MB of IOVA space, while the 
> pixel stream can address the full range:
>     +-----------------------------------------------------------+
>     | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>     | 0x25800000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
>     | pixel stream addressable range (0 - 3.5 GB)               |
>     | 0x00000000 - 0xe0000000                                   |
>     +-----------------------------------------------------------+
> 
> A single "iommus" property on the video-codec node puts every stream in
> one IOMMU domain sharing one IOVA allocator, so nothing keeps a
> non-pixel buffer inside the low 600 MB. Once an allocation lands below
> that boundary the hardware faults, which shows up as unhandled SMMU page
> faults and spontaneous reboots:
> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> 
> Fix was made in iris/venus driver to reserve the 0-600MB range and 
> thereby prevent iova allocation from that range. 
> https://lore.kernel.org/all/20260818-reserve_iova_in_driver-v2-0-5005a1154408@oss.qualcomm.com
> 
> Given that the address range restriction is for specific VPU stream, it 
> should be ideally moved to that stream. To achieve the same, a subset 
> of streams is now represented as subnodes, so that each can be 
> associated with its respective addressable range.

Patchset does not apply, neither on next nor on provided base. At least
b4 review fails here. It seems that pieces of the code here might be
not complete and there are followups, so merge these follow ups here.

Best regards,
Krzysztof


