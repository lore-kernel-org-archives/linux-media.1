Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9451F4176
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 01:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784509904; cv=none; b=Zra6uOKXb9yMAYMLjfvgT9PoBhtSLWe5We5u3vMqp3Ow03GHZiwWpP7hJEQBLwpmY/nl3354s8/wlgWToJ0AhHSRJZqdQqAs15tUuaoXnApDPdIW/05I1XQfkCqOethukudmXApcSHB/SDvvCJfbmOSTQEvQTpQ7iVxEFtmRkzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784509904; c=relaxed/simple;
	bh=Pq7BY98qSyosGScIWwD7GLm/dqH5Alj/b2UyLq4Wwr0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j3I011WC9nEoJCXdXzQi1s4ZTfdlWkq/kKN6aOGv2O0+PpTFaLvMs7+VgF64uADzsYRe0b+4bTemwsNKDseE8BcAAmuWXSv1jXG0KO8Y5qP3VhHL0HCVXrNX66tcEpG44hqt6kVpiwCwIZ2sUvVEtWOzIWayq8UMq1KoQaxew6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UKHuGWTG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UKHuGWTG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so5582105e9.0
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 18:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784509901; x=1785114701; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NBzFqo1q62oUHnanuR3X/f6GVIfyfY7mdfBhjgPaDbc=;
        b=UKHuGWTGzSaMgfWbq5FtDHDufm+yVuustdsKYmBj6hAzXNbPiRM8Yhe6zYb9pVXiO9
         3hv1u1MrPq+CN1JRojJCKwwiWLBwq0GFJi/vu+nRbk0DF8l1sWzv0b2ydO61FlqcyNtk
         YVRIei7CUg5sAyAHr/HxHBOMMaXi0HZiXByDPDWdVNjQIwKOyIhF8XNDIZ6bGix3e77t
         ldpWVeG8oBGQI74F/CWSsU+tzVgg83riMLT20BYYgEiLJqFJguiBuI7ATBNoE+XLITHi
         BYHFESKlvQtLUR+UOMZ4TqsUQAVnlgukU9lDzDqZmumDnx/yhi6pSACcd/8kLPxwFGo1
         kgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784509901; x=1785114701;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NBzFqo1q62oUHnanuR3X/f6GVIfyfY7mdfBhjgPaDbc=;
        b=cPdvc6CATO2M08s7LXwVg3aVmfdlXQmIbbFbL2M1JR5G6LYVsEL4jjvlBw6F9wUxRo
         7Py9nwnawiPTIhQ82QJxUrkdF4dag3M/espU5ZUKtYKIwRBQjW98DPpbj8uQYP89B949
         YTD9GY2P7iQYNsrwvb6WKaOsMjNbtf0tjOvmRj0VxGSPlG2ziwTtacGOxMG2EckNG/IB
         Aj3y+m0eovlKZVYsSyy5q7SXsYKmoES4LJtUiQn2rnd1dDbv/c6Mwiy8RgKnmuO5n2SO
         BU2b65QSONHolyJqkEOPa3Ezb0L43f2PMPqQrtUOK3OEJNiBERPEtGpcU6L/wF9ntoKH
         eUNg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7hG34OFas62YL+ijtw+7lGi0zkKCsTIJ8FiHY51g8WXCqr0gqVeOmne4BPm1wyl3rnamfXHSqB1msag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg1XpukVWGcw5ueAEvSRX064v9fhGd1gcCjVnPqDdYxAE7UQFs
	yk5VFsurw9xl56ow/MoBXY/eHNmeAWhe8Ht0+t2Xea5a3Q9J5BmsUt+/vYSgfzS8WrI=
X-Gm-Gg: AfdE7cll+2IAL4Vs9KectoAGCJck+2KwgY5ounetZTTZ+d/rOxw665VpnOQbjc92kGU
	e+m8lApd5D7m3TEfTlWt5YvwU5sEZYsl354zVaggbSzAS76JZtt9hoKmqFTKtTeWFLQEsBzkJHm
	0fltm2P4IpmisX7iGT/1O5tisPviAUtssnBQyTHyIcc0JrJqFbsHGJmtaT/7nNHHRvyuA0cr0An
	l2bfxOzJqXI2yq0/Bi9CI46Oo2xreEVnlX+TIY347MCUog4oBLPCJ4lMJFX6ce5HllSvMF1ZZrN
	uVm5F58Ifs1AYLTF5DGn6xoR1oZjAq7UZMvhI+0ovzFkM4VlpEiiwHL0jONO1f9P1nFoD6pAZhU
	XrxEfOujQG4hxCCzwYs6X7cDtf0LW5Q2ed40StGcD3vx161hBOKZ0G7jcTmJLJDX1aqrKZjZOCC
	OtdpKoKUvTVjR9
X-Received: by 2002:a05:600c:4f94:b0:493:d741:5d72 with SMTP id 5b1f17b1804b1-4954a513ef9mr124626705e9.38.1784509900440;
        Sun, 19 Jul 2026 18:11:40 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.79.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954d384146sm180847285e9.14.2026.07.19.18.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 18:11:39 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v13 0/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
Date: Mon, 20 Jul 2026 02:11:33 +0100
Message-Id: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33SzWrDMAwA4FcpOc9Dkv932nuMHfyX1jCakozQU
 vLuswujwWY7WvBJsqT7sKQ5p2V4O9yHOa15ydO5PJC/HIZwcudjYjmWwEBAEjQCu2JiYcnELqc
 bG5XgwiuJkbuhkMucxnx95Pv4LO9TXr6n+fZIv2KN/pFoRQZMCxe8lx4V+fevfHbz9DrNx6FmW
 ulXKyCSjaaqtVQpeqWTs53me60azYtGTAqMllYgdFo8Nce2tijaQgBLwI0xsdNyp7vasuiCx6B
 HGQD7f6unloSNVrV21DxaH3WkvnO919RoXadmg0cyMLqoOm32mjfaFO2MVMoIaUtrnbZPrcE02
 tZ/E4KvoxNh7DTCjmPLy/0Ak5rA6TJzK3nvce9t6/ExOXCYIihO/daQ/vX14kLQHLHsNDZ727b
 tBzIJjaBaAwAA
X-Change-ID: 20250710-x1e-csi2-phy-f6434b651d3a
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14352;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=Pq7BY98qSyosGScIWwD7GLm/dqH5Alj/b2UyLq4Wwr0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqXXXJ3/JlvNOzl97qTVn1T+JAAKIJuHkfX5MQR
 SGmLxHznR2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCal11yQAKCRAicTuzoY3I
 Oo39EACjIuL/XiVTmGeYdDltonHYi+ibhBK+sg53z8USjh2u3/m675K+cWDO61UJEE6oWM+Zoe3
 OaVM+k9XmahAMhKHf3O+YefvobuZP5Pdltwu01jxO0RVET1nqehIDny04j/y/Ogtw+cl2y7+F5O
 euFGWAcK+nFTlnly8DUO6ZwAjx3SPc3+n+4djNFTGrtOyf3hAAJGBEDUUGSlXSflCDbPFQruwWj
 nFUL3DTeoR4ZtjEkpIYFMuRGeh0on0uQ4cpWJ+ZnAmD4+/o/t6u9Rah4agQT/oBc+AGHaHDKOwq
 Jh/XHdnvuN5grnW2ZkHycmMHfj0wFTZbmLExzYFNguSqYbEiECF6j8pDp6O4r8688t03rV7baiG
 fn3vTIX2uyjvt7XlQ7ZkPb0nZGoVGa+KklHMHwlImhCD6pLRqX3e4N0WnKhjLgJ1Vwtwc9QgrGm
 Iv7Maq8tXcd6NOvrvegBNQi/9cHR/5B19mY+QBRSbMw7SZ3R+EiIvwaZ5XTpZxrTl0Txb3Q7fGt
 hRnZzo23kHqHR+IQwQj3pnOSlUyNuynMFYLKaq3F8PQD7efeoFYdaJvQoaBPsv3MlFQcr+27E4y
 YxR7Q7lgcCyo4a1HKIrgGPfdfYW7K4y/AowmW35pJsMvXHunK5at8qfjxzk/qXMklg4aAGnkGD2
 ijNUJ/ybU1iljxw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

This driver is very critical to several SoCs being merged and CPHY being
added to Qualcomm SoCs.

It would be very beneficial therefore to get this merged in this cycle. A
lot of other enablement code depends on it.

Vinod, Kishon what do you need to take this for 7.2 ?

Changes in v13:
- Fixed two sashiko "high" flagged items. Hopefully for the last time.
- Added PM_OPP to depends - Sashiko
- Link to v12: https://patch.msgid.link/20260719-x1e-csi2-phy-v12-0-cc7311326d1b@linaro.org

Changes in v12:
- Fixes indexing for data-lanes = <0 1 2 4> which is out of range - Sashiko
- The rest of Sashiko's review rebutted on list - bod
- Link to v11: https://patch.msgid.link/20260719-x1e-csi2-phy-v11-0-9d0a1ed0632d@linaro.org

Changes in v11:
- Adds RB - Krzysztof
- Fixes div_u64 to div64_u64 - Sashiko
- Fixes pos * 2 reg offset - Sashiko
- Fixes devm_pm_runtime_enable. Missed in v10 - Frank

- Link to v10: https://patch.msgid.link/20260718-x1e-csi2-phy-v10-0-5720a7888953@linaro.org

Changes in v10:
- Rewords commit log of yaml schema to read more organically - Krzysztof
- title: Qualcomm X1E80100 SoC CSI2 PHY - Krzysztof
- opp-table: object - Krzysztof
- Example opp-table in PHY node - Krzysztof
- port@1 uses stock graph.yaml - Krzysztof
- Dropped redundant remote-endpoint declaration - Krzysztof
- vdda-0p9 - SoC pins are vdda-0p9 rail is l2c_0p8. Named as with pin - Vlad, Konrad
- Retaining #phy-cells = 1.
  Rob gave a steer to have the consumer configure this via DT. Not the way
  Vlad suggests but I'm sticking to Rob's guidance for now - Rob/Vlad.
- data-lanes - retained as per CAMSS existing.
  Nihal suggested, I agreed and Loic added his assent too. Vlad disagrees
  with this. I accept Nihal's suggestion though we should remain
  consistent. - Nihal, Loic, Vlad.

- pd_data = {} - Sashiko, Wengmeng
- lanes_enable() failure unwinds - Sashiko
- power_off and error paths drop OPP rate before performance state - Sashiko
- probe returns -ENODEV when pd_list is NULL with ret == 0 - Sashiko
- Move to devm_clk_bulk_get_all(), timer clock taken from the bulk,
  clk_names indirection removed from soc_cfg - Frank
- Drop static CSI_COMMON_CTRL5 (0x1014) table row - Nihal

- Link to v9: https://patch.msgid.link/20260708-x1e-csi2-phy-v9-0-0210b90c04cf@linaro.org

Changes in v9:

Key advantages of implementing this logic as drivers/phy:

  a) Per-PHY power rails become declarable and enforceable on a per-PHY
     basis.
  b) With future adaptations of CAMSS routing the PHY output to something
     other than the CSI Decoders becomes possible.
  c) Standard framework contract. phy_configure(mipi_dphy opts) / power_on / of_xlate.
  d) Introduction of CPHY in this driver will elaborate CPHY for Linux in
     general as there is currently no mipi_cphy_opts structure.

- TITAN_TOP_GDSC retained. Further elaboration in below link. - Vlad
  Link: https://lore.kernel.org/all/d5407ab1-1af7-4678-ae67-5cf30ce8fa4b@kernel.org/
- Consumer selects PHY mode - Rob Herring
  Link: https://lore.kernel.org/linux-media/20250710230846.GA44483-robh@kernel.org/
- Incorporates two comments by Krzysztof I missed previously - krzk
- Changes 0p9 rail name to 0p8 - Konrad, Sashiko
- Uses port@0 and port@1 to denote input/output - Vladimir
- Label phy@ instead of csiphy@ in example - Sashiko
- Drops additional entries in example opp one is enough - bod
- return 0 on timer_period_ps < 6. - Sashiko
- Use power-domain names and a "scaled" bool to flag if
  a power-domain needs to be scaled or not. Allowing the code to
  attached to all PDs, GDSC and RPMPD alike but only scale the
  RPMPD. - Sashiko
- Fixes error cleanup flagged by Sashiko.
- Checks args->args_count. Sashiko
- Performs checks on pd_list == NULL. Sashiko
- Makes opp-table required. Sashiko
- Uses const "core" and "timer" when getting clocks. - Loic
- Adds AHB clock - Vijay
- Revert v7 lane-enable change, BIT(pos * 2) is correct: data-lanes
  are logical indices, CSI_COMMON_CTRL5 is a physical bitmap - Nihal
- Adds a comment to explain clock-lane - Nihal
- Link to v8: https://patch.msgid.link/20260523-x1e-csi2-phy-v8-0-a85668459521@linaro.org

Changes in v8:
- Fixes two dt verification splats I missed by passing the wrong yaml file
  to my checking script :( - Rob's bot
- Fixes the polarity offset error - thanks Sashiko.
- CONFIG_PM implies CONFIG_GENERIC_PM_DOMAINS no change - Sashiko, Bryan
- Implemented suggested unwinding by Sashiko
- Leaving the flagged settle_cnt alone. Requires invalid DT settings and in
  addition the result is just a long settle count. Not real bug - Sashiko
- Link to v7: https://patch.msgid.link/20260522-x1e-csi2-phy-v7-0-79cb1280fad6@linaro.org

Changes in v7:
- Made CONFIG_PM a dependency. Sashiko commented on the pd_list being NULL
  and suggested I check the pointer but, we need to ramp the rails when
  switching clock rate so we need CONFIG_PM full stop. - Sashiko.ai, Bryan
- Added unwind operation for performance state error path - Sashiko
- Made clock-lanes genuinely optional for the supported use-case. - Sashiko
- Fixed the enable of lanes. Thus far we have had forever it seems
  val |= BIT(lane.pos * 2) which I've never looked at much because it
  has always worked. But looking at how to switch on polarities I realised
  the relevant register is a linear bitmask without gaps so the correct
  method is `val |= BIT(lane.pos)`.
  This needs an update in the legacy PHY too in another series - Bryan
- I opted not to do any of the "but if DT send junk into your driver" fixes
  from Sashiko since TBH I think the code would be Spaghetti afterwards.
  We trust DT and if DT is wrong we fix it, we don't try to graph its
  relative (in)sanity.
- Fixed my example in the yaml. Sashiko
- Link to v6: https://patch.msgid.link/20260521-x1e-csi2-phy-v6-0-9d73d9bd7d20@linaro.org

Changes in v6:
- Taking feedback from lively debate added ports and
  endpoints to the PHY - Neil, Vlad
- Detection of split mode by way of which ports are declared.
  port@0 is always a sensor input.
  port@1 is optional and if present implies split-mode
  port@2 is always the output. - Dmitry, Neil, Vlad.
- Split mode is left as -ENOTSUPP unless/until someone with the appropriate
  hardware can take on responsibility to drive to completion.
- Extending phy_config_opts dropped.
  I think this is a worthwhile extension but this series no longer depends
  on it so dropped. - Bryan
- MX/MXC.
  Two OPP tables one for CSIPHY0/1/2 scaling MXC one for CSIPHY4 keeping
  MXA at LOWSVS_D1 - to be implemented in DT not here. Taniya, Konrad, Bryan
- Changed MAINTAINERS from Supported to Maintained.
  Hobby time for me right now. - Bryan
- Link to v5: https://lore.kernel.org/r/20260326-x1e-csi2-phy-v5-0-0c0fc7f5c01b@linaro.org

v5:
- Adds support to apply passed parameters for clock/data position/polarity - Neil
- Drops GEN1/GEN2 differentiation this can be reconstituted if GEN1 ever
  gets supported in this driver - Dmitry
- Drops camnoc_axi, cpas_ahb - Konrad
- Renames csiphy->core csiphy_timer->timer - Konrad
- Renames rail from 0p8 to 0p9 schematics say  VDD_A_CSI_n_0P9 - Konrad
- TITAN_TOP_GDSC dropped - Konrad
- Passes PHY_QCOM_CSI2_MODE_{DPHY|CPHY|SPLIT_DPHY} with the controller
  selecting the mode. Only DPHY mode is supported but the method to pass
  CPHY or split-mode DPHY configuration is there.
  Since split-mode is a Qualcomm specific mode the PHY modes are defined in
  our binding instead of adding a new type to include/linux/phy/phy.h - bod
- Depends-on: https://lore.kernel.org/r/20260325-dphy-params-extension-v1-0-c6df5599284a@linaro.org
- Link to v4: https://lore.kernel.org/r/20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org

v4:
- MMCX, MCX and MX/MXA power-domains added - Dmitry, Vijay, Konrad
- power-domain-names added as required - bod
- opp-tables amended to capture RPMHPD deps - Dmitry, Vijay
- Switched to dev_pm_opp_set_rate, dev_pm_domain_attach_by_name etc
  dropped inherited CAMSS code - Dmitry
- Amended parameters structure to specify power-domain name list - bod
- Removed dead defines - Dmitry
- Noted in CSIPHY commit log intention to rework patterns of
  PHY lane configs into loops/defines/bit-fields later - Dmitry, bod
- Lowercase hex throughout - Dmitry
- The yaml and code in this driver doesn't care if the node is a
  sibling or a sub-node of CAMSS confirmed to work both ways - Dmitry, bod
- Link to v3: https://lore.kernel.org/r/20260226-x1e-csi2-phy-v3-0-11e608759410@linaro.org

v3:

- Resending this to make clear this submission is additive to x1e/Hamoa
  The existing bindings and code will continue to work 
  Bindings are added only, nothing is subtracted from existing ABI.
- Link to v2: https://lore.kernel.org/r/20260225-x1e-csi2-phy-v2-0-7756edb67ea9@linaro.org

v2:

In this updated version

- Added operating-point support
  The csiphy clock sets the OPP prior to setting the rate
  for csiphy and csiphy_timer - Konrad

- Combo mode
  Combo mode in CAMSS yaml has been added. Right now
  no code has been changed in the PHY driver to support it as
  I don't have hardware to test. In principle though it can
  be supported. - Vladimir

- CSIPHY init sequences
  I left these as their "magic number formats". With my diminished
  status as a non-qcom VPN person - I can no longer see what the bits
  map to. Moreover this is the situation any non-VPN community member
  will be in when submitting CSIPHY sequences derived from downstream.

  I think it is perfectly reasonable to take public CSIPHY init sequences
  as magic numbers. If someone with bit-level access wants to enumerate
  the bits that's fine but, it shouldn't gate in the interim. - Konrad/bod

- Sensor endpoints
  I've stuck to the format used by every other CSIPHY in upstream.
  Sensor endpoints hit the CAMSS/CSID endpoint not a endpoint in the PHY.
  Given the proposed changes to CAMSS though to support "combo mode" I
  think this should achieve the same outcome - multiple sensors on the one
  PHY without introducing endpoints into the PHY that no other CSIPHY in
  upstream currently has.

- Bitmask of enabled lanes
  Work needs to be done in the v4l2 layer to really support this.
  I propose making a separate series dedicated to non-linear bit
  interpretation after merging this so as to contain the scope of the
  series to something more bite (byte haha) sized. - Konrad/bod

- Link to v1: https://lore.kernel.org/r/20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org

v1:
This short series adds a CSI2 MIPI PHY driver, initially supporting D-PHY
mode. The core logic and init sequences come directly from CAMSS and are
working on at least five separate x1e devices.

The rationale to instantiate CSI2 PHYs as standalone devices instead of as
sub-nodes of CAMSS is as follows.

1. Precedence
   CAMSS has a dedicated I2C bus called CCI Camera Control Interface.
   We model this controller as its own separate device in devicetree.
   This makes sense and CCI/I2C is a well defined bus type already modelled
   in Linux.

   MIPI CSI2 PHY devices similarly fit into a well defined separate
   bus/device structure.

   Contrast to another CAMSS component such as VFE, CSID or TPG these
   components only interact with other CAMSS inputs/outputs unlike CSIPHY
   which interacts with non-SoC components.

2. Hardware pinouts and rails
   The CSI2 PHY has its own data/clock lanes out from the SoC and indeed
   has its own incoming power-rails.

3. Other devicetree schemas
   There are several examples throughout the kernel of CSI PHYs modeled as
   standalone devices which one assumes follows the same reasoning as given
   above.

I've been working on this on-and-off since the end of April:
Link: https://lore.kernel.org/linux-media/c5cf0155-f839-4db9-b865-d39b56bb1e0a@linaro.org

There is another proposal to have the PHYs be subdevices of CAMSS but, I
believe we should go with a "full fat" PHY to match best practices in
drivers/phy/qualcomm/*.

Using the standard PHY API and the parameter passing that goes with it
allows us to move away from custom interfaces in CAMSS and to conform more
clearly to established PHY paradigms such as the QMP combo PHY.

Looking at existing compat strings I settled on
"qcom,x1e80100-mipi-csi2-combo-phy" deliberately omitting reference to the
fact the PHY is built on a four nano-meter process node, which seems to
match recent submissions to QMP PHY.

My first pass at this driver included support for the old two phase
devices:

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/a504c28d109296c93470340cfe7281231f573bcb#b6e59ed7db94c9da22e492bb03fcda6a4300983c

I realised that the device tree schema changes required to support a
comprehensive conversion of all CAMSS to this driver would be an
almost certainly be unacceptable ABI break or at the very least an enormous
amount of work and verification so I instead aimed to support just one new
SoC in the submission.

I've retained the callback indirections give us scope to add in another type of
future PHY including potentially adding in the 2PH later on.

This driver is tested and working on x1e/Hamoa and has been tested as not
breaking sc8280xp/Makena and sm8250/Kona.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
      phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver

 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 195 +++++++++
 MAINTAINERS                                        |  10 +
 drivers/phy/qualcomm/Kconfig                       |  15 +
 drivers/phy/qualcomm/Makefile                      |   5 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 385 ++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     | 449 +++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  97 +++++
 7 files changed, 1156 insertions(+)
---
base-commit: 8dac27bfa2f994ecb11f01a63641527d17d48fc1
change-id: 20250710-x1e-csi2-phy-f6434b651d3a

Best regards,
--  
Bryan O'Donoghue <bryan.odonoghue@linaro.org>

