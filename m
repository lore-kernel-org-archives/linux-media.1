Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701998;
	b=RBp7kVyIjhZjF4AsxpOTCkZzt2JN8RvvJ0+K2DuCjEPduDuaTR3jWLnx7WFd+NnFUFMm
	 AYHycs/0/AmXrcTgw0Z9wo67eUxIZl2VTAS/iauNg6235cJvz1qs9cQn//qRP+v4Z+T2B
	 3xIXXh+L0tgbDFOmrYLhXAX15jywJq7fiwtTkcqsWRTmqLs5MYvlGz64HnR5M6YPhBVZI
	 Y+YNag64vWRPTMDJDNympl5F8AluHk6zbKNf9LADfqSdidJlcZBi88D0t5u4Pbx9XCP50
	 n8z8ava8bp17ef+TSDFFCRhvwmGlm4JhQnDXH8tXLuHst1yyBx8oW+ayw2murrkTBJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701998;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=TEZtEk59ar5utkdkofEnlN7m91UDjSKwzqLEuSBAhEY=;
	b=fTZQ39ZP576XQaGAJ19vfb9m3lBidhmy5ycTKN3sBPLvi3zCExrA22s4/ueFSMRAeBj+
	 K5pPuOqWd/xO5qJZDg/YH9nv91cmDKgUn0WNOUMpoKR+K2polLmSOU35pAdKC77nuyLSr
	 khrlyvLwk5bZva9jItfaiWq4qj+0CpzZHLO3W8O1zlVyhRbf0lb311AqwEamEpjGMG1yx
	 +VIlzCByO81n0ehfOBi/9FNWjQEw2K+3WKbo5QYcs8DSTq7AElNKywvwiSiysuNH54w/U
	 Tq4e7ozEcRZEL9HVUf2Rc1/IeE1M482IZBNVDcetkeSdt/uH8aG97gtdXiW6XlRVQ8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=sQgsBU51;
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09E0606F7D1;
	Tue,  3 Nov 2026 10:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E09E0606F7D1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=sQgsBU51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793701995; x=1793961195;
	bh=TEZtEk59ar5utkdkofEnlN7m91UDjSKwzqLEuSBAhEY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=sQgsBU51kdqOyzVY+YUU56iyfNMUx7aemy3pDR6mCnv4VLJQbphFBhBvked2R8qEL
	 zy0BNO4K3sCYKKj9KkNeI+MfDhV6hilEvmXdU5mH7qZsL/8NcjM6lwYFl1iSD6tpqq
	 GOwY1zYWOy4pb9oc8oGBhmY8SG5aWilKMzzCLDVmYCdWW8E677+VVtYe94vDEKyhZa
	 XWJIGCLxTif8I9EDBsW5cS0fMe35kG51MDbZygm41hN1gmQ9PPMrhHsq9vMQnZhO2a
	 apT3N39+1S0litm7Hm5B84sd4elMlSR63VbuWlQxCZEA0ednDD7mziYksMnLNz1MqG
	 rTv+3NQpyN3pA==
Date: Tue, 03 Nov 2026 10:33:08 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] media: ipu-bridge: Add ST VD55G0
Message-ID: <20261103103235.94397-4-lsa.uz@pm.me>
In-Reply-To: <20261103103235.94397-1-lsa.uz@pm.me>
References: <20261103103235.94397-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 73730b433b21375baf7551216efcf388fc025ed1
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The infrared camera of the Surface Pro 11 with Intel is an ST VD55G0,
enumerated by ACPI as SMO55F0 and wired to the IPU7 over one CSI-2 data
lane.

The vd55g0 driver takes only a link frequency whose MIPI rate, twice it,
is an integer multiple of the input clock. 396 MHz gives 792 Mbps, 33
times the 24 MHz the sensor's SSDB lists on the Surface Pro 8, 9, 10 and
11, and within the sensor's 750 to 1200 Mbps. Peter Marshall's earlier
patch for the Surface Pro 9 used 380 MHz, 760 Mbps, which is not a
multiple of 24 MHz, so the driver would refuse it:
https://lore.kernel.org/all/20260918221705.323510-4-pm@petermarshall.ca/

Assisted-by: Claude:claude-opus-5-5 sparse
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel=
/ipu-bridge.c
index 3739c4a2a8c..cb1d1582fa1 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -120,6 +120,8 @@ static const struct ipu_sensor_config ipu_supported_sen=
sors[] =3D {
 =09IPU_SENSOR_CONFIG("OVTI5693", 1, 419200000),
 =09/* Omnivision OV8856 */
 =09IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
+=09/* STMicroelectronics VD55G0 */
+=09IPU_SENSOR_CONFIG("SMO55F0", 1, 396000000),
 =09/* Sony IMX471 */
 =09IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 =09/* Sony IMX471 (found on Lenovo X1 Carbon G14) */
--=20
2.54.0


